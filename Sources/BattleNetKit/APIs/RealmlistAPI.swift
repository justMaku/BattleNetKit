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
    }
    
    let client: BattleNet
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {}
    func register(with connectionAPI: ConnectionAPI) throws {}
    
    public func requestRealmlistTicket(gameAccount: EntityId, completion: @escaping (Data) -> Void) throws {
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
            
            completion(ticket)
        }
    }
    
    public func requestSubRegions(completion: @escaping ([String]) -> Void) throws {
        try self.client.gamesUtilitiesAPI.getAllValues(for: Attribute.init(command: "CharacterListRequest")) { (attributes) in
            completion(attributes.map { $0.stringValue })
        }
    }
    public func requestRealmList(in region: String, with ticket: Data, completion: @escaping ([JamJSONRealmListUpdatePart]) -> Void) throws {
        let request = try ClientRequest(command: "CharacterListRequest", value: region, parameters: [
                Attribute(parameter: "RealmListTicket", value: ticket)
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { (response) in
            guard let realmlist = response.attribute["Param_RealmList"] else {
                throw Error.noRealmlistTicketReceived
            }
            
            let realms = try realmlist.value.jamValue(of: JSONRealmListUpdates.self).updates
            completion(realms)
    public func requestRealmIpAddress(for address: UInt64, in subregion: String, with ticket: Data, completion: @escaping (String) -> Void) throws {
        let request = try ClientRequest(command: "RealmJoinRequest", value: subregion, parameters: [
            Attribute(parameter: "RealmAddress", value: address),
            Attribute(parameter: "RealmListTicket", value: ticket),
            Attribute(parameter: "BnetSessionKey", value: self.client.authenticationAPI.sessionKey ?? Data())
            ]
        )
        
        try self.client.gamesUtilitiesAPI.send(request) { response in
            guard let attribute = response.attribute["Param_ServerAddresses"] else {
                throw Error.noServerAddressesRecevied
            }
            
            let addresses = try attribute.value.jamValue(of: JSONRealmListServerIPAddresses.self)
            
            completion(addresses.families.first?.addresses.first?.ip ?? "")
        }
    }
}
