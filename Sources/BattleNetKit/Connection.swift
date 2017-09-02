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
    func handle(_ packet: Packet, context: Connection.Context?) throws
    func importedService(with id: UInt32) throws -> ServiceType
    func exportedService(with id: UInt32) throws -> ServiceType
}

class Connection {
    
    enum Error: Swift.Error {
        case noContextForReply(header: Header)
        case invalidContextForReply(header: Header)
    }
    
    enum Context {
        case noReply(packet: Packet)
        case reply(packet: Packet, completionBlock: CompletionBlock, responseType: Message.Type)
    }
    
    typealias CompletionBlock = ((Packet) -> Void)
    
    static private let auroraPort: UInt16 = 1119;
    

    
    public var delegate: ConnectionDelegate? = nil
    
    private let socket: Socket
    private let region: Region
    private var requestToken: UInt32 = 0
    private var outgoingQueue: [UInt32: Context] = [:]
    private var awaitingReply: [UInt32: Context] = [:]

    private var running = false
        
    init(region: Region) throws {
        self.region = region
        self.socket = try Socket(mode: .client,
                             hostname: region.host,
                             port: Connection.auroraPort,
                             certificates: .mozilla,
                             verifyHost: false,
                             verifyCertificates: false,
                             cipher: Config.Cipher.legacy)
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
            keepAlive()
            
            for (token, context) in outgoingQueue {
                switch context {
                case .noReply(let packet):
                    try send(packet, token: token)
                case .reply(let packet, _, _):
                    try send(packet, token: token)
                    awaitingReply[token] = context
                }
            }
            
            outgoingQueue = [:]
            
            if let packet = try read() {
                let context = awaitingReply[packet.header.token]
                
                try delegate?.handle(packet, context: context)

                if context != nil {
                    awaitingReply.removeValue(forKey: packet.header.token)
                }
            }
        }
    }
    
    func keepAlive() {
//        let header = Header()
//        header.serviceID = ConnectionService.id
//        header.methodID = ConnectionService.Method.forceDisconnect
    }
    
    func stop() {
        running = false
    }
    
    func queue(_ packet: Packet) {
        let token: UInt32
        if packet.header.serviceID != ReplyService.id {
            token = next()
        } else {
            token = packet.header.token
        }
        
        outgoingQueue[token] = Context.noReply(packet: packet)
    }
    
    func queue(_ packet: Packet, completion: @escaping CompletionBlock, responseType: Message.Type) {
        let token: UInt32
        if packet.header.serviceID != ReplyService.id {
            token = next()
        } else {
            token = packet.header.token
        }

        outgoingQueue[token] = Context.reply(packet: packet, completionBlock: completion, responseType: responseType)
    }
    
    private func next() -> UInt32 {
        let next = requestToken
        requestToken = next + 1
        
        return next
    }
    
    private func send(_ packet: Packet, token: UInt32) throws {
        var mutableHeader = packet.header
        
        mutableHeader.token = token
        let modifiedPacket = Packet(header: mutableHeader, message: packet.message)

        let packetData = try modifiedPacket.encode()
        try socket.send(packetData.bytes)
        print("[\(modifiedPacket.header.token)] Sending call to service: \(modifiedPacket.header.serviceID) method: \(modifiedPacket.header.methodID)")
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
        let messageData = Data(bytes: messageBytes)
        
        print("[\(header.token)] Received call to service: \(header.serviceID) method: \(header.methodID) status: \(BattleNetError(rawValue: header.status)!)")

        if messageBytes.count == 0 {
            print(header)
            return nil
        }
        
        let message: Message
        if header.serviceID == ReplyService.id {
            guard let context = awaitingReply[header.token] else {
                throw Error.noContextForReply(header: header)
            }
            
            switch context {
            case .noReply: throw Error.invalidContextForReply(header: header)
            case .reply(_, _ , let reponseType):
                message = try reponseType.init(serializedData: messageData)
            }
        } else {
            guard let service = try delegate?.exportedService(with: header.serviceID) else {
                return nil
            }
            
            let method = try type(of: service).method(with: header.methodID)
            let messageType = method.responseType
            
            message = try messageType.init(serializedData: messageData)
        }
        
        let packet = Packet(header: header, message: message)
        
        return packet
    }
}
