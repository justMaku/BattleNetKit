//
//  RealmlistAPI.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.12.17.
//

import Foundation
import Result
import Dispatch

public class RealmlistAPI: API {
    public enum Environment: String {
        case live
        case classic
        
        var attributeVersion: Attribute.Version {
            switch self {
            case .classic: return .classic
            case .live: return .live
            }
        }
    }
    
    public enum InternetProtocolVersion: Int8 {
        case IPV4 = 1
        case IPV6 = 2
        
        public static var allCases: [InternetProtocolVersion] {
            return [.IPV4, .IPV6]
        }
    }
    
    public enum Error: Swift.Error {
        case noRealmlistTicketReceived
        case noRealmlistReceived
        case noServerAddressesRecevied
        case battleNetError(error: Swift.Error)
    }
    
    public struct RealmJoinInfo {
        public let addresses: [Address]
        public let joinTicket: Data
        public let joinSecret: Data
    }
    
    let client: BattleNet
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {}
    func register(with connectionAPI: ConnectionAPI) throws {}
    
    public func requestRealmlist(
        for account: EntityId,
        environment: Environment = .live,
        completion: @escaping (Realmlist) throws -> Void
    ) throws {
        var realmBySubregion: [Subregion: [RealmlistRealmEntry]] = [:]
        
        let mainGroup = DispatchGroup()
        mainGroup.enter()
        try self.requestRealmlistTicket(gameAccount: account, environment: environment) { (ticket) in
            try self.requestSubRegions(environment: environment) { (subregions) in
                let regionsGroup = DispatchGroup()

                try subregions.forEach { subregion in
                    regionsGroup.enter()

                    realmBySubregion[subregion] = []
                    try self.requestRealmList(in: subregion, with: ticket, environment: environment) { (result) in
                        let realms = try? result.dematerialize()
                        
                        let realmsGroup = DispatchGroup()
                        
                        try realms?.forEach { realm in
                            realmsGroup.enter()
                            try? self.requestRealmJoin(for: realm, in: subregion, with: ticket, environment: environment) { result in
                                let response = try? result.dematerialize()
                                
                                let entry = RealmlistRealmEntry(realm: realm, addresses: response?.addresses ?? [])
                                realmBySubregion[subregion]?.append(entry)
                                realmsGroup.leave()
                            }
                        }
                        
                        realmsGroup.notify(queue: .main) {
                            regionsGroup.leave()
                        }
                    }
                }
                
                regionsGroup.notify(queue: .main) {
                    mainGroup.leave()
                }
            }
        }
        
        mainGroup.notify(queue: .main) {
            let realmlist = realmBySubregion.map(RealmlistSubregionEntry.init)
            try? completion(realmlist)
        }
    }
    
    public func requestRealmlistTicket(
        gameAccount: EntityId,
        clientSecret: [UInt8] = [UInt8].init(repeating: 0, count: 32),
        environment: Environment = .live,
        completion: @escaping (Data) throws -> Void
    ) throws {
        Log.debug("Requesting realmlist ticket", domain: .realmlist)
        let identity = try JSONRealmListTicketIdentity(entityID: gameAccount)
        let clientInfo = JSONRealmListTicketClientInformation(info: JamJSONRealmListTicketClientInformation(
            platform: Constants.platformName.fourCC(),
            platformType: Constants.platformType.fourCC(),
            clientArch: Constants.clientArchitecture.fourCC(),
            systemArch: Constants.systemArchitecture.fourCC(),
            currentTime: (Int32)(Date().timeIntervalSince1970),
            buildVariant: Constants.buildVariant,
            timeZone: "Etc/UTC",
            systemVersion: Constants.systemVersion,
            versionDataBuild: Constants.clientVersion.versionBuild,
            audioLocale: Constants.localeName.fourCC(),
            version: Constants.clientVersion,
            secret: clientSecret,
            type: Constants.gameClientName.fourCC(),
            textLocale: Constants.localeName.fourCC()
            )
        )
        
        let request = try ClientRequest(
            command: "RealmListTicketRequest",
            version: environment.attributeVersion,
            parameters: [
                try Attribute(parameter: "Identity", jam: identity),
                try Attribute(parameter: "ClientInfo", jam: clientInfo)
            ]
        )
        
        try client.gamesUtilitiesAPI.send(request) { (result) in
            Log.debug("Received realmlist ticket", domain: .realmlist)
            
            guard let ticket = try result.dematerialize().attribute["Param_RealmListTicket"]?.value.blobValue else {
                throw Error.noRealmlistTicketReceived
            }
            
            try completion(ticket)
        }
    }
    
    public func requestSubRegions(
        environment: Environment = .live,
        completion: @escaping ([Subregion]) throws -> Void
    ) throws {
        let attribute = try Attribute.init(command: "CharacterListRequest", version: environment.attributeVersion)
        try self.client.gamesUtilitiesAPI.getAllValues(for: attribute) {
            (result) in
            try completion(result.dematerialize().map(Subregion.init))
        }
    }
    
    public func requestRealmList(
        in subregion: Subregion,
        with ticket: Data,
        environment: Environment = .live,
        completion: @escaping (Result<[Realm], Error>) throws -> Void
    ) throws {
        let request = try ClientRequest(
            command: "RealmListRequest",
            value: subregion.description,
            version: environment.attributeVersion,
            parameters: [
                Attribute(parameter: "RealmListTicket", value: ticket)
            ]
        )

        try self.client.gamesUtilitiesAPI.send(request) { (result) in
            do {
                guard let realmlist = try result.dematerialize().attribute["Param_RealmList"] else {
                    try completion(Result(error: Error.noRealmlistReceived))
                    return
                }
                
                let jam = try realmlist.value.jamValue(of: JSONRealmListUpdates.self)
                let realms = jam.updates.map { $0.update }.map(Realm.init)
                try completion(Result(value: realms))
            } catch let error {
                try completion(Result(error: .battleNetError(error: error)))
            }
        }
    }
    
    public func requestRealmJoin(
        for realm: Realm,
        in subregion: Subregion,
        with ticket: Data,
        environment: Environment = .live,
        protocols: [InternetProtocolVersion] = InternetProtocolVersion.allCases,
        completion: @escaping (Result<RealmJoinInfo, Error>) throws -> Void
    ) throws {
        let request = try ClientRequest(
            command: "RealmJoinRequest",
            value: subregion.description,
            version: environment.attributeVersion,
            parameters: [
                Attribute(parameter: "RealmAddress", value: UInt64(realm.identifier)), // Has to be UInt64
                Attribute(parameter: "RealmListTicket", value: ticket),
                Attribute(parameter: "BnetSessionKey", value: self.client.authenticationAPI.sessionKey ?? Data())
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { result in
            do {
                let response = try result.dematerialize()
                
                guard let attribute = response.attribute["Param_ServerAddresses"] else {
                    throw Error.noRealmlistReceived
                }
                let jam = try attribute.value.jamValue(of: JSONRealmListServerIPAddresses.self)
                let requestedProtocols = protocols.map { $0.rawValue }
                let addresses = jam.families.filter { requestedProtocols.contains($0.family) }.flatMap { $0.addresses }.map(Address.init)
                
                let joinInfo = RealmJoinInfo(addresses: addresses,
                                             joinTicket: response.attribute["Param_RealmJoinTicket"]!.value.blobValue,
                                             joinSecret: response.attribute["Param_JoinSecret"]!.value.blobValue)
                
                try completion(Result(value: joinInfo))
            } catch let error {
                try completion(Result(error: .battleNetError(error: error)))
            }
        }
    }
}
