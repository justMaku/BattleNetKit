//
//  Connection.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation
import Dispatch

import TLS
import Result

protocol ConnectionDelegate {
    func connection(_: Connection, didConnectToRegion: Region) throws
    func handle(_ packet: Packet, context: Connection.Context?) throws
    func service(importedAs id: UInt32) throws -> ServiceType
    func service(exportedAs id: UInt32) throws -> ServiceType
    func handle(_ error: Error) throws
}

class Connection {
    
    public enum Error: Swift.Error {
        case noContextForReply(header: Header)
        case invalidContextForReply(header: Header)
        case battleNetError(error: BattleNetError)
        case emptyMessage
        case noServiceProvider
    }
    
    enum Context {
        case noReply(packet: Packet)
        case reply(packet: Packet, completionBlock: CompletionBlock, responseType: Message.Type)
    }
    
    typealias CompletionBlock = (Result<Packet, Error>) throws -> Void
    
    static private let auroraPort: UInt16 = 1119;
    
    public var delegate: ConnectionDelegate? = nil
    
    public let region: Region
    
    private let socket: Socket
    private var requestToken: UInt32 = 0
    private var outgoingQueue: [UInt32: Context] = [:]
    private var awaitingReply: [UInt32: Context] = [:]

    private var running = false
    private var queue = DispatchQueue(label: "loop")
        
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
        try self.delegate?.connection(self, didConnectToRegion: region)
    }
    
    func run() throws {
        running = true
        
        queue.async {
            do {
                try self.loop()
            } catch let error {
                try? self.delegate?.handle(error)
                self.running = false
                return
            }
        }
    }
    
    func loop() throws {
        while (running) {
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
        Log.debug("Queued message to service: \(packet.header.serviceID), method: \(packet.header.methodID)", domain: .aurora)
    }
    
    func queue(_ packet: Packet, completion: @escaping CompletionBlock, responseType: Message.Type) {
        let token: UInt32
        if packet.header.serviceID != ReplyService.id {
            token = next()
        } else {
            token = packet.header.token
        }

        outgoingQueue[token] = Context.reply(packet: packet, completionBlock: completion, responseType: responseType)
        Log.debug("Queued message with a callback to service: \(packet.header.serviceID), method: \(packet.header.methodID)", domain: .aurora)
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
        Log.debug("Sent message to service: \(packet.header.serviceID), method: \(packet.header.methodID)", domain: .aurora)
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
        
        guard header.status == BattleNetError.ok.rawValue else {
            let error = BattleNetError(rawValue: Int64(header.status)) ?? BattleNetError.unknown
            
            guard
                header.serviceID == ReplyService.id,
                let context = awaitingReply[header.token],
                case let Context.reply(_, completionBlock, _) = context
            else {
                throw error
            }
            
            try completionBlock(Result(error: Error.battleNetError(error: error)))
            
            return nil
        }
        
        let messageBytes = try socket.receive(max: Int(header.size))
        let messageData = Data(bytes: messageBytes)
        
        if messageBytes.count == 0 {
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
            guard let delegate = self.delegate else {
                throw Error.noServiceProvider
            }
            
            let service = try delegate.service(exportedAs: header.serviceID)
            let method = try type(of: service).method(with: header.methodID)
            let messageType = method.responseType
            
            message = try messageType.init(serializedData: messageData)
        }
        
        let packet = Packet(header: header, message: message)
        Log.debug("Received packet, service: \(packet.header.serviceID), method: \(packet.header.methodID)", domain: .aurora)

        return packet
    }
}
