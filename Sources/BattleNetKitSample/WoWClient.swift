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
    enum Error: Swift.Error {
        case unknownOpcode(opcode: UInt16)
        case malformedPacket(opcode: UInt16, payload: [UInt8])
        case nonServerOpcodeReceived(opcode: Opcode)
    }
    
    private let socket: TCPInternetSocket
    private var queue = DispatchQueue(label: "loop")
    private var running = false
    private var realm: Realm
    private var clientSecret: [UInt8]
    private var joinInfo: RealmlistAPI.RealmJoinInfo
    private var sessionKey: [UInt8] = []
    
    private let crypto: Crypto
    
    init(realm: Realm, joinInfo: RealmlistAPI.RealmJoinInfo, secret: [UInt8]) throws {
        self.realm = realm
        self.joinInfo = joinInfo
        self.clientSecret = secret
        
        self.crypto = Crypto.init(clientSecret: secret, serverSecret: joinInfo.joinSecret.bytes)
        
        let ip = joinInfo.addresses[0]
        Log.debug("Connecting to realm \(realm.name) at: \(ip.address):\(ip.port)")
        self.socket = try TCPInternetSocket(address: .init(hostname: ip.address, port: ip.port))
    }
    
    func connect() throws {
        try self.socket.connect()
        
        // Exchange pleasantries with server.
        let _ = try self.socket.read(count: 48)
        try self.socket.send(data: "WORLD OF WARCRAFT CONNECTION - CLIENT TO SERVER\n".toBytes())
        Log.debug("Exchanged pleasantries with the server.")
    }
    
    func run() throws {
        running = true
        
        queue.async {
            do {
                try self.loop()
            } catch let error {
                Log.error("Connection with server stopped because of error: \(error)")
                self.running = false
                return
            }
        }
    }
    
    private func loop() throws {
        while (self.socket.closed == false) {
            do {
                let packet = try self.read()
                Log.debug("Read packet: \(packet)")
                try? self.handle(packet: packet)
            } catch let error as Error {
                switch error {
                case .unknownOpcode(let opcode):
                    Log.warning("Unknown opcode received: \(String(format:"0x%02X", opcode))")
                default:
                    throw error
                }
            } catch let _ as TCPInternetSocketExtensionError {
                
            }
        }
        
        Log.debug("Connection to server closed.")
    }
    
    private func read() throws -> ServerPacket {
        let size: UInt32
        if self.crypto.encryptionEnabled {
            let bytes = try socket.read(count: 4)
            size = UInt32(bytes: self.crypto.decrypt(data: bytes))
        } else {
            size = try socket.read() as UInt32
        }
        
        Log.debug("Expecting a packet with size: \(size)")
        let rawOpcode = try socket.read() as UInt16
        let payload = try socket.read(count: Int(size - 2))

        guard let opcode = Opcode.init(rawValue: rawOpcode) else {
            throw Error.unknownOpcode(opcode: rawOpcode)
        }
        
        guard let packetImpl = opcode.implementation as? ServerPacket.Type else {
            throw Error.nonServerOpcodeReceived(opcode: opcode)
        }
        
        Log.debug("Fully read packet of size: \(size)")
        return try packetImpl.parse(payload: payload)
    }
    
    private func send<T: ClientPacket>(packet: T) throws {
        Log.debug("Sending packet: \(packet)")
        let size = UInt32(packet.payload.count) + UInt32(T.opcode.bytes.count)
        var data = self.crypto.encryptionEnabled ? self.crypto.encrypt(data: size.bytes) : size.bytes
        data += T.opcode.bytes
        data += packet.payload
        
        try self.socket.send(data: data)
        Log.debug("Sent packet: \(packet)")
    }
    
    private func handle(packet: ServerPacket) throws {
        Log.debug("Handling packet: \(packet)")
        switch packet {
        case let challenge as AuthChallenge:
            try self.handleAuthChallenge(challenge: challenge)
        case let response as AuthResponse:
            try self.handleAuthResponse(response: response)
        case let request as EnableEncryption:
            try self.handleEnableEncryption(request: request)
        case let packet as CompressedPacket:
            try self.handle(packet: packet.underlyingPacket)
        case let packet as MultiplePackets:
            try packet.underlyingPackets.forEach(self.handle)
        default:
            Log.warning("No handler defined for message type: \(type(of: packet))")
        }
    }
    
    private func handleAuthChallenge(challenge: AuthChallenge) throws {
        let serverChallenge = challenge.serverChallenge
        let clientChallenge = AES.randomIV(16)
        
        let realmJoinProof = try crypto.calculateRealmJoinProof(clientChallenge: clientChallenge, serverChallenge: serverChallenge)
        self.sessionKey = try crypto.calculateSessionKey(clientChallenge: clientChallenge, serverChallenge: serverChallenge)

        let response = AuthSession(
            region: realm.region,
            battleGroup: realm.group,
            realm: realm.id,
            localChallenge: clientChallenge,
            realmJoinProof: realmJoinProof,
            realmJoinTicket: joinInfo.joinTicket.bytes)

        try self.send(packet: response)
    }
    
    private func handleAuthResponse(response: AuthResponse) throws {
        let result = response.result
        
        Log.debug("Auth response: \(String(format:"0x%08X", result))")
        
        if result != 0 {
            try self.socket.close()
            return
        }
        
//        try self.send(packet: HotfixRequest(hotfixes: [21561, 907, 1354]))
    }
    
    private func handleEnableEncryption(request: EnableEncryption) throws {
        let response = AcknowledgeEncryption()
        try self.send(packet: response)
        try self.crypto.enable(sessionKey: self.sessionKey)
    }
}
