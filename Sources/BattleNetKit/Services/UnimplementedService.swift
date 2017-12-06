//
//  ResourcesService.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 19.08.17.
//

import Foundation

private enum Error: Swift.Error {
    case unimplementedService(name: String)
}

protocol UnimplementedService: ServiceType {}

extension UnimplementedService {
    static func method(with id: UInt32) throws -> MethodType {
        throw Error.unimplementedService(name: self.name)
    }
    
    static func handles(_ type: MethodType) -> Bool {
        return false
    }
}

class ResourceService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.resources.Resources"
}

class AccountNotifyService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.account.AccountNotify"
}

class ChallengeService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.challenge.ChallengeService"
}

class ChannelInvitationNotifyService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.channel_invitation.ChannelInvitationNotify"
}

class ChannelInvitationService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.channel_invitation.ChannelInvitationService"
}

class ChannelOwnerService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.channel.ChannelOwner"
}

class ChannelService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.channel.Channel"
}

class ChannelSubscriberService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.channel.ChannelSubscriber"
}

class FriendsNotify: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.friends.FriendsNotify"
}

class FriendsService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.friends.FriendsService"
}

class GameFactorySubscriberService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.game_master.GameFactorySubscriber"
}

class GameMasterService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.game_master.GameMaster"
}

class GameMasterSubscriberService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.game_master.GameMasterSubscriber"
}

class NotificationListenerService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.notification.NotificationListener"
}

class NotificationService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.notification.NotificationService"
}

class PresenceService: UnimplementedService {
    var id: UInt32? = nil
    static let name = "bnet.protocol.presence.PresenceService"
}

