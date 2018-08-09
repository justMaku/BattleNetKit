//
//  WoWClient.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 08.08.18.
//

import Foundation
import SocksCore
import CryptoSwift
import BattleNetKit

class WoWClient {
    private let socket: TCPInternetSocket
    private var queue = DispatchQueue(label: "loop")
    private var running = false
    private var realm: Realm
    private var secret: [UInt8]
    private var joinInfo: RealmlistAPI.RealmJoinInfo
    private var sessionKey: [UInt8] = []
    private var encrypted = false
    
    init(realm: Realm, joinInfo: RealmlistAPI.RealmJoinInfo, secret: [UInt8]) throws {
        self.realm = realm
        self.joinInfo = joinInfo
        self.secret = secret
        
        let ip = joinInfo.addresses[2]
        self.socket = try TCPInternetSocket(address: .init(hostname: ip.address, port: ip.port))
    }
    
    func connect() throws {
        try self.socket.connect()
        let bytes = try self.socket.recv(exactly: 48)
        print(bytes.hexString())
        try self.socket.send(data: "WORLD OF WARCRAFT CONNECTION - CLIENT TO SERVER\n".toBytes())
        try print(String(bytes: bytes))
    }
    
    func run() throws {
        running = true
        
        queue.async {
            do {
                try self.loop()
            } catch let error {
                self.running = false
                return
            }
        }
    }
    
    private func loop() throws {
        while (true) {
            
            let size: UInt32
            if self.encrypted {
                let bytes = try socket.recv(exactly: 4)
                let decrypted = try WoWCrypto.decrypt(data: bytes)
                size  = decrypted.withUnsafeBufferPointer {
                    ($0.baseAddress!.withMemoryRebound(to: UInt32.self, capacity: 1) { $0 })
                }.pointee
            } else {
                size = try socket.read() as UInt32
            }
            print("Received packet with size: \(size)")
            let opcode = try socket.read() as UInt16
            
            try handle(opcode: opcode, size: size)
        }
    }
    
    private func handle(opcode: UInt16, size: UInt32) throws {
        switch opcode {
        case 0x256C:
            try self.handleAuthResponse()
        case 0x3048:
            try self.sendAuthResponse()
        case 0x3049:
            try self.handleEnableEncryption()
        default:
            print("Unknown packet: \(String(format:"0x%02X", opcode))")
            let payload = try socket.recv(exactly: Int(size - 2))
            print(payload.hexString())
        }
    }
    
    private func handleEnableEncryption() throws {
        self.encrypted = true
        var payload: [UInt8] = []
        payload.append(contentsOf: (0x3767 as UInt16).bytes)
        
        let packet = UInt32(payload.count).bytes + payload
        
        try self.socket.send(data: packet)
        try WoWCrypto.startDecrypt(sessionKey: self.sessionKey)
    }
    
    private func handleAuthResponse() throws {
        let result = try self.socket.read() as UInt32
        print("result: \(String(format:"0x%02X", result))")
    }
    
    private func sendAuthResponse() throws {
        _ = try self.socket.recv(exactly: 32)
        let serverChallange = try self.socket.recv(exactly: 16)
        _ = try self.socket.read() as UInt8
        
        var payload: [UInt8] = []
        let localChallange = AES.randomIV(16)
        let digest = try WoWCrypto.realmJoinProof(clientSecret: self.secret, joinSecret: self.joinInfo.joinSecret.bytes, clientChallange: localChallange, serverChallange: serverChallange)
        self.sessionKey = try WoWCrypto.sessionKey(clientSecret: self.secret, joinSecret: self.joinInfo.joinSecret.bytes, clientChallange: localChallange, serverChallange: serverChallange)
        
        payload.append(contentsOf: (0x3765 as UInt16).bytes)
        payload.append(contentsOf: (0x0 as UInt64).bytes)
        payload.append(contentsOf: realm.region.bytes)
        payload.append(contentsOf: realm.group.bytes)
        payload.append(contentsOf: realm.id.bytes)
        payload.append(contentsOf: localChallange)
        payload.append(contentsOf: digest)
        payload.append(0x00)
        payload.append(contentsOf: UInt32(joinInfo.joinTicket.count).bytes)
        payload.append(contentsOf: joinInfo.joinTicket.bytes)

        let packet = UInt32(payload.count).bytes + payload
        
        try self.socket.send(data: packet)
    }
    
    private func sendHotfixRequest() throws {
        var payload: [UInt8] = []
        payload.append(contentsOf: (0x35E5 as UInt16).bytes)

        let packet = UInt16(payload.count).bytes + payload
        
        try self.socket.send(data: packet)
    }
}

extension TCPInternetSocket {
    func recv(exactly: Int) throws -> [UInt8] {
        var remaining = exactly
        var buffer: [UInt8] = []
        while buffer.count < exactly {
            let curr = try self.recv(maxBytes: remaining)
            buffer.append(contentsOf: curr)
            remaining = exactly - buffer.count
        }
        
        return buffer
    }
    
    func read<T: FixedWidthInteger>() throws -> T {
        var bytes = try self.recv(exactly: MemoryLayout<T>.size)
        return T(bytes: bytes)
    }
    
    func write<T: FixedWidthInteger>(value: T) throws  {
        try self.send(data: value.bytes)
    }
}

extension FixedWidthInteger {
    init(bytes: [UInt8]) {
        var i: Self = 0
        for j in (0..<MemoryLayout<Self>.size) { i = i | (Self(bytes[j]) << Self(j * 8)) }
        
        self = i
    }
    
    var bytes: [UInt8] {
        var value = self
        return withUnsafeBytes(of: &value) { Array($0) }
    }
}

private let CHexLookup : [Character] = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" ]
extension Collection where Self.Element == UInt8 {
    
    public func hexString() -> String {
        var stringToReturn = ""

        for byte in self {
            let asInt = Int(byte)
            stringToReturn.append(CHexLookup[asInt >> 4])
            stringToReturn.append(CHexLookup[asInt & 0x0f])
        }
        
        return stringToReturn
    }
}

public class StringMisc {}
