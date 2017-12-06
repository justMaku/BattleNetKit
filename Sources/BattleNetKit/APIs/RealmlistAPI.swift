//
//  RealmlistAPI.swift
//  BattleNetKitPackageDescription
//
//  Created by Michał Kałużny on 05.12.17.
//

import Foundation

public class RealmlistAPI: API {
    
    let client: BattleNet
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {}
    func register(with connectionAPI: ConnectionAPI) throws {}
    
    func requestRealmlistTicket(gameAccount: EntityId) throws {
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
        }
    }
}
