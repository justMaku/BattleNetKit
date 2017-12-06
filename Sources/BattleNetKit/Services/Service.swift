//
//  Service.swift
//  BattleNet
//
//  Created by Michał Kałużny on 09/09/2016.
//
//

import Foundation

protocol MethodType {
    var id: UInt32 { get }
    var name: String { get }
    var requestType: Message.Type { get }
    var responseType: Message.Type { get }
    
    init?(id: UInt32)
}

extension MethodType where Self: RawRepresentable, Self.RawValue == Int {
    init?(id: UInt32) {
        self.init(rawValue: Int(id))
    }
}

protocol ServiceType {
    static var name: String { get }
    
    var id: UInt32? { get set }
    static func method(with id: UInt32) throws -> MethodType
    
    static func handles(_ type: MethodType) -> Bool
}

class ReplyService: ServiceType {
    static var id: UInt32 = 254
    static var name = "reply service"
    var id: UInt32? = ReplyService.id
    
    static func method(with id: UInt32) throws -> MethodType {
        throw ServiceTypeError.unknownMethodForService(method: id)
    }
    
    static func handles(_ type: MethodType) -> Bool {
        return false
    }
}

enum MethodTypeError: Swift.Error {
    case unknownMethod(method: UInt32)
}

enum ServiceTypeError: Swift.Error {
    case invalidRoutingForPacket(packet: Packet)
    case unknownMethodForService(method: UInt32)
    case unableToCreateHashForName(name: String)
    case cantRegisterUnboundService
}

enum ServiceName: UInt32 {
    case authServerService = 1
    case gameUtilitiesService
    case gameMasterService
    case notificationService
    case presenceService
    case channelService
    case channelOwnerService
    case channelInvitationService
    case friendsService
    case challengeService
    case accountService
    case resourcesService
    
    case authClientService
    case gameMasterSubscriberService
    case gameFactorySubscriberService
    case notificationListenerService
    case channelSubscriberService
    case channelInvitationNotifyService
    case friendsNotify
    case challengeNotify
    case accountNotify
}

extension ServiceType {
    func hash() throws -> UInt32 {
        var hash: UInt32 = 0x811C9DC5;
        guard let bytes = Self.name.data(using: .ascii, allowLossyConversion: false)?.bytes else {
            throw ServiceTypeError.unableToCreateHashForName(name: Self.name)
        }
        
        for byte in bytes {
            hash ^= UInt32(byte)
            hash = hash.multipliedReportingOverflow(by: 0x1000193).partialValue
        }
        
        return hash
    }
    
    func handle(_ packet: Packet) throws {
        guard packet.header.serviceID == self.id else {
            throw ServiceTypeError.invalidRoutingForPacket(packet: packet)
        }
    }
}
