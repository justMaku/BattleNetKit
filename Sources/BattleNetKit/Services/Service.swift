//
//  Service.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation

protocol MethodType: RawRepresentable {
    
    var id: UInt32 { get }
    var name: String { get }
    var requestType: Message.Type { get }
    var responseType: Message.Type { get }
    
    
    init?(rawValue: Int)
}

protocol ServiceType {
    var id: UInt32 { get }
    static var name: String { get }
}

enum ServiceTypeError: Swift.Error {
    case invalidRoutingForPacket(packet: Packet)
}

extension ServiceType {
    func hash() throws -> UInt32 {
        var hash: UInt32 = 0x811C9DC5;
        guard let bytes = Self.name.data(using: .ascii, allowLossyConversion: false)?.bytes else {
            return 0 // TODO: Throw an error here
        }
        
        for byte in bytes {
            hash ^= UInt32(byte)
            hash = hash.multipliedReportingOverflow(by: 0x1000193).partialValue
        }
        
        return hash
    }
    
    func handle(_ packet: Packet) throws {
        guard packet.header.serviceID == id else {
            throw ServiceTypeError.invalidRoutingForPacket(packet: packet)
        }
    }
}
