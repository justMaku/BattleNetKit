//
//  Connection.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation
import TLS

protocol ConnectionDelegate {
    func handle(_ packet: Packet) throws
    func service(with id: UInt32) throws -> ServiceType 
}

class Connection {
    static let auroraPort: UInt16 = 1119;
    
    let socket: Socket
    let region: Region
    
    var requestToken: UInt32 = 0
    var outgoingQueue: [Packet] = []
    var delegate: ConnectionDelegate? = nil
    
    private var running = false
        
    init(region: Region) throws {
        self.region = region
        self.socket = try Socket(mode: .client,
                             hostname: region.host,
                             port: Connection.auroraPort,
                             certificates: .mozilla,
                             verifyHost: false,
                             verifyCertificates: false,
                             cipher: Config.Cipher.compat)
    }
    
    func connect() throws {
        try socket.connect(servername: region.host)
    }
    
    func run() throws {
        running = true
        try loop()
    }
    
    func loop() throws {
        while (running) {
            if let packet = outgoingQueue.first {
                try send(packet)
                outgoingQueue = Array<Packet>(outgoingQueue.dropFirst(1))
            }
            
            if let message: Message = try read() as? Message {
                print("Received message: \(message)")
            }
        }
    }
    
    func stop() {
        running = false
    }
    
    func queue(_ packet: Packet) {
        outgoingQueue.append(packet)
    }
    
    private func next() -> UInt32 {
        let next = requestToken
        requestToken = next + 1
        
        return next
    }
    
    private func send(_ packet: Packet) throws {
        var mutableHeader = packet.header
        
        mutableHeader.token = next()
        let modifiedPacket = Packet(header: mutableHeader, message: packet.message)

        let packetData = try modifiedPacket.encode()
        try socket.send(packetData.bytes)
    }
    
    func read() throws -> Packet? {
        let sizeBytes = try socket.receive(max: 2)
        
        guard sizeBytes.count > 0 else {
            return nil
        }
        
        let size = sizeBytes[0] << 8 | sizeBytes[1]
        let headerBytes = try socket.receive(max: Int(size))
        let headerData = Data(bytes: headerBytes)
        let header = try Header(serializedData: headerData)
        let messageBytes = try socket.receive(max: Int(header.size))
        let packet = Packet(header: header, message: nil)
        
        return packet
    }
}
