//
//  RealmlistAPI.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.12.17.
//

import Foundation

public class RealmlistAPI: API {
    
    enum Error: Swift.Error {
        case noRealmlistTicketReceived
        case noRealmlistReceived
        case noServerAddressesRecevied
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
                            try self.requestRealmIpAddress(for: realm, in: subregion, with: ticket) { addresses in
                                let entry = RealmlistRealmEntry(realm: realm, addresses: addresses)
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
    
    public func requestRealmlistTicket(gameAccount: EntityId, completion: @escaping (Data) throws -> Void) throws {
        Log.debug("Requesting realmlist ticket", domain: .realmlist)
        let secret = Data.init(count: 32)
        let identity = JSONRealmListTicketIdentity(entityID: gameAccount)
        let clientInfo = JSONRealmListTicketClientInformation(info: JamJSONRealmListTicketClientInformation(
            platform: Constants.platformName.fourCC(),
            currentTime: (Int32)(Date().timeIntervalSince1970),
            buildVariant: Constants.buildVariant,
            timeZone: "Etc/UTC",
            versionDataBuild: Constants.clientVersion.versionBuild,
            audioLocale: Constants.localeName.fourCC(),
            version: Constants.clientVersion,
            secret: secret.bytes,
            type: Constants.clientTypeName.fourCC(),
            textLocale: Constants.localeName.fourCC()
            )
        )
        
        let request = try ClientRequest(command: "RealmListTicketRequest", parameters: [
            try Attribute(parameter: "ClientInfo", jam: clientInfo),
            try Attribute(parameter: "Identity", jam: identity)
        ])
        
        try client.gamesUtilitiesAPI.send(request) { (response) in
            Log.debug("Received realmlist ticket", domain: .realmlist)
            
            guard let ticket = response.attribute["Param_RealmListTicket"]?.value.blobValue else {
                throw Error.noRealmlistTicketReceived
            }
            
            try completion(ticket)
        }
    }
    
    public func requestSubRegions(completion: @escaping ([Subregion]) throws -> Void) throws {
        try self.client.gamesUtilitiesAPI.getAllValues(for: Attribute.init(command: "CharacterListRequest")) { (attributes) in
            try completion(attributes.map(Subregion.init))
        }
    }
    
    public func requestRealmList(in subregion: Subregion, with ticket: Data, completion: @escaping ([Realm]) throws -> Void) throws {
        let request = try ClientRequest(command: "CharacterListRequest", value: subregion.description, parameters: [
                Attribute(parameter: "RealmListTicket", value: ticket)
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { (response) in
            guard let realmlist = response.attribute["Param_RealmList"] else {
                throw Error.noRealmlistReceived
            }
            
            let jam = try realmlist.value.jamValue(of: JSONRealmListUpdates.self)
            let realms = jam.updates.map { $0.update }.map(Realm.init)
            try completion(realms)
        }
    }

    public func requestRealmIpAddress(for realm: Realm, in subregion: Subregion, with ticket: Data, completion: @escaping ([Address]) throws -> Void) throws {
        let request = try ClientRequest(command: "RealmJoinRequest", value: subregion.description, parameters: [
            Attribute(parameter: "RealmAddress", value: realm.identifier),
            Attribute(parameter: "RealmListTicket", value: ticket),
            Attribute(parameter: "BnetSessionKey", value: self.client.authenticationAPI.sessionKey ?? Data())
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { response in
            guard let attribute = response.attribute["Param_ServerAddresses"] else {
                throw Error.noServerAddressesRecevied
            }
            
            let jam = try attribute.value.jamValue(of: JSONRealmListServerIPAddresses.self)
            let addresses = jam.families.flatMap { $0.addresses }.map(Address.init)
            try completion(addresses)
        }
    }
}
