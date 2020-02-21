import Foundation
import NIO

public class RealmlistAPI: API {
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

    unowned var gameUtilitiesAPI: GameUtilitiesAPI
    private let eventLoop: EventLoop

    required init(
        eventLoop: EventLoop,
        gameUtilitiesAPI: GameUtilitiesAPI
    ) {
        self.eventLoop = eventLoop
        self.gameUtilitiesAPI = gameUtilitiesAPI
    }

    public func requestRealmlist(
        for gameAccountID: EntityId,
        with sessionKey: Data,
        environment: Environment
    ) -> EventLoopFuture<Realmlist> {
        return self
            .requestRealmlistTicket(for: gameAccountID.proto)
            .flatMap { ticket in
                return self.requestSubRegions(environment: environment).flatMap { subregions in
                    return subregions.map { subregion in
                        self
                            .requestSubRegionRealmList(in: subregion, with: ticket, environment: environment)
                            .flatMap { realms in
                                realms.map { realm in
                                    self.requestRealmJoin(realm: realm, in: subregion, ticket: ticket, sessionKey: sessionKey, environment: environment)
                                        .map { joinInfo in RealmlistRealmEntry(realm: realm, addresses: joinInfo.addresses) }
                                }
                            }
                            .map { RealmlistSubregionEntry(subregion: subregion, realms: $0) }
                    }
                }
            }
    }

    public func requestRealmlistTicket(
        for gameAccountID: Bgs_Protocol_EntityId,
        clientSecret: [UInt8] = [UInt8].init(repeating: 0, count: 32),
        environment: Environment = .live
    ) -> EventLoopFuture<Data> {
        do {
            let identity = try JSONRealmListTicketIdentity(entityID: gameAccountID)
            let clientInfo = JSONRealmListTicketClientInformation(
                info: JamJSONRealmListTicketClientInformation(
                    platform: Constants.platformName.fourCC(),
                    platformType: Constants.platformType.fourCC(),
                    clientArch: Constants.clientArchitecture.fourCC(),
                    systemArch: Constants.systemArchitecture.fourCC(),
                    currentTime: (Int32)(Date().timeIntervalSince1970),
                    buildVariant: Constants.buildVariant,
                    timeZone: "Etc/UTC",
                    systemVersion: Constants.systemVersion,
                    versionDataBuild: environment.clientVersion.versionBuild,
                    audioLocale: Constants.localeName.fourCC(),
                    version: environment.clientVersion,
                    secret: clientSecret,
                    type: Constants.gameClientName.fourCC(),
                    textLocale: Constants.localeName.fourCC()
                )
            )

            let request = try Bgs_Protocol_GameUtilities_V1_ClientRequest(
                command: "RealmListTicketRequest",
                version: environment.attributeVersion,
                parameters: [
                    try Bgs_Protocol_Attribute(parameter: "Identity", jam: identity),
                    try Bgs_Protocol_Attribute(parameter: "ClientInfo", jam: clientInfo),
                ]
            )

            return self.gameUtilitiesAPI.send(request).flatMapThrowing { response in
                guard let ticket = response.attribute["Param_RealmListTicket"]?.value.blobValue else {
                    throw Error.noRealmlistTicketReceived
                }

                return ticket
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }

    public func requestSubRegions(
        environment: Environment = .live
    ) -> EventLoopFuture<[Subregion]> {
        do {
            let attribute = try Bgs_Protocol_Attribute(command: "CharacterListRequest", version: environment.attributeVersion)
            return self.gameUtilitiesAPI
                .getAllValues(for: attribute)
                .flatMapThrowing {
                    try $0.map(Subregion.init)
                }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }

    public func requestSubRegionRealmList(
        in subregion: Subregion,
        with ticket: Data,
        environment: Environment = .live
    ) -> EventLoopFuture<[Realm]> {
        do {
            let request = try Bgs_Protocol_GameUtilities_V1_ClientRequest(
                command: "RealmListRequest",
                value: subregion.description,
                version: environment.attributeVersion,
                parameters: [
                    Bgs_Protocol_Attribute(parameter: "RealmListTicket", value: ticket),
                ]
            )

            return self.gameUtilitiesAPI.send(request).flatMapThrowing { response -> [Realm] in
                guard let realmlist = response.attribute["Param_RealmList"] else {
                    throw Error.noRealmlistReceived
                }

                let jam = try realmlist.value.jamValue(of: JSONRealmListUpdates.self)
                return jam.updates.map { Realm(jam: $0.update) }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }

    public func requestRealmJoin(
        realm: Realm,
        in subregion: Subregion,
        ticket: Data,
        sessionKey: Data,
        environment: Environment = .live,
        protocols: [InternetProtocolVersion] = InternetProtocolVersion.allCases
    ) -> EventLoopFuture<RealmJoinInfo> {
        do {
            let request = try Bgs_Protocol_GameUtilities_V1_ClientRequest(
                command: "RealmJoinRequest",
                value: subregion.description,
                version: environment.attributeVersion,
                parameters: [
                    Bgs_Protocol_Attribute(parameter: "RealmAddress", value: UInt64(realm.identifier)), // Has to be UInt64
                    Bgs_Protocol_Attribute(parameter: "RealmListTicket", value: ticket),
                    Bgs_Protocol_Attribute(parameter: "BnetSessionKey", value: sessionKey),
                ]
            )

            return self.gameUtilitiesAPI.send(request).flatMapThrowing { response -> RealmJoinInfo in
                guard let attribute = response.attribute["Param_ServerAddresses"] else {
                    throw Error.noRealmlistReceived
                }

                let jam = try attribute.value.jamValue(of: JSONRealmListServerIPAddresses.self)
                let requestedProtocols = protocols.map { $0.rawValue }
                let addresses = jam.families.filter { requestedProtocols.contains($0.family) }.flatMap { $0.addresses }.map(Address.init)

                let joinInfo = RealmJoinInfo(
                    addresses: addresses,
                    joinTicket: response.attribute["Param_RealmJoinTicket"]!.value.blobValue,
                    joinSecret: response.attribute["Param_JoinSecret"]!.value.blobValue
                )

                return joinInfo
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}
