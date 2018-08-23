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
    
    public enum Error: Swift.Error {
        case noRealmlistTicketReceived
        case noRealmlistReceived
        case noServerAddressesRecevied
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
    
    public func requestRealmlist(for account: EntityId, completion: @escaping (Realmlist) throws -> Void) throws {
        var realmBySubregion: [Subregion: [RealmlistRealmEntry]] = [:]
        
        let mainGroup = DispatchGroup()
        mainGroup.enter()
        try self.requestRealmlistTicket(gameAccount: account) { (ticket) in
            try self.requestSubRegions { (subregions) in
                let regionsGroup = DispatchGroup()

                try subregions.forEach { subregion in
                    regionsGroup.enter()

                    realmBySubregion[subregion] = []
                    try self.requestRealmList(in: subregion, with: ticket) { (realms) in
                        let realmsGroup = DispatchGroup()
                        
                        try realms.forEach { realm in
                            realmsGroup.enter()
                            try self.requestRealmJoin(for: realm, in: subregion, with: ticket) { result in
                                let response = try result.dematerialize()
                                let entry = RealmlistRealmEntry(realm: realm, addresses: response.addresses)
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
        completion: @escaping (Data) throws -> Void
    ) throws {
        Log.debug("Requesting realmlist ticket", domain: .realmlist)
        let identity = try JSONRealmListTicketIdentity(entityID: gameAccount)
        let clientInfo = JSONRealmListTicketClientInformation(info: JamJSONRealmListTicketClientInformation(
            platform: Constants.platformName.fourCC(),
            currentTime: (Int32)(Date().timeIntervalSince1970),
            buildVariant: Constants.buildVariant,
            timeZone: "Etc/UTC",
            versionDataBuild: Constants.clientVersion.versionBuild,
            audioLocale: Constants.localeName.fourCC(),
            version: Constants.clientVersion,
            secret: clientSecret,
            type: Constants.gameClientName.fourCC(),
            textLocale: Constants.localeName.fourCC(),
            platformType: Constants.platformName.fourCC(),
            systemArch: Constants.systemArchitecture.fourCC(),
            clientArch: Constants.clientArchitecture.fourCC()
            )
        )
        
        let request = try ClientRequest(command: "RealmListTicketRequest", parameters: [
            try Attribute(parameter: "ClientInfo", jam: clientInfo),
            try Attribute(parameter: "Identity", jam: identity)
        ])
        
        try client.gamesUtilitiesAPI.send(request) { (result) in
            Log.debug("Received realmlist ticket", domain: .realmlist)
            
            guard let ticket = try result.dematerialize().attribute["Param_RealmListTicket"]?.value.blobValue else {
                throw Error.noRealmlistTicketReceived
            }
            
            try completion(ticket)
        }
    }
    
    public func requestSubRegions(completion: @escaping ([Subregion]) throws -> Void) throws {
        try self.client.gamesUtilitiesAPI.getAllValues(for: Attribute.init(command: "CharacterListRequest")) {
            (result) in
            try completion(result.dematerialize().map(Subregion.init))
        }
    }
    
    public func requestRealmList(in subregion: Subregion, with ticket: Data, completion: @escaping ([Realm]) throws -> Void) throws {
        let request = try ClientRequest(command: "RealmListRequest", value: subregion.description, parameters: [
                Attribute(parameter: "RealmListTicket", value: ticket)
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { (result) in
            guard let realmlist = try result.dematerialize().attribute["Param_RealmList"] else {
                throw Error.noRealmlistReceived
            }
            
            let jam = try realmlist.value.jamValue(of: JSONRealmListUpdates.self)
            let realms = jam.updates.map { $0.update }.map(Realm.init)
            try completion(realms)
        }
    }
    
    public func requestRealmJoin(for realm: Realm, in subregion: Subregion, with ticket: Data, completion: @escaping (Result<RealmJoinInfo, Error>) throws -> Void) throws {
        let request = try ClientRequest(command: "RealmJoinRequest", value: subregion.description, parameters: [
            Attribute(parameter: "RealmAddress", value: UInt64(realm.identifier)), // Has to be UInt64
            Attribute(parameter: "RealmListTicket", value: ticket),
            Attribute(parameter: "BnetSessionKey", value: self.client.authenticationAPI.sessionKey ?? Data())
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { result in
            do {
                var response = try result.dematerialize()
                
                guard let attribute = response.attribute["Param_ServerAddresses"] else {
                    throw Error.noRealmlistReceived
                }
                let jam = try attribute.value.jamValue(of: JSONRealmListServerIPAddresses.self)
                let addresses = jam.families.filter { $0.family == 1 }.flatMap { $0.addresses }.map(Address.init)
                
                let joinInfo = RealmJoinInfo(addresses: addresses,
                                             joinTicket: response.attribute["Param_RealmJoinTicket"]!.value.blobValue,
                                             joinSecret: response.attribute["Param_JoinSecret"]!.value.blobValue)
                
                try completion(Result(value: joinInfo))
            } catch let error {
                try completion(Result(error: Error.noRealmlistReceived))
            }
        }
    }
}
