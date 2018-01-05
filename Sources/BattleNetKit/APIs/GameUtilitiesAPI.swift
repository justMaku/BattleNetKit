//
//  GameUtilitiesAPI.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 06.12.17.
//

import Foundation

public class GamesUtilitiesAPI: API {
    
    let serverService = GameUtilitiesService()
    let client: BattleNet
    
    required public init(client: BattleNet) {
        self.client = client
    }
    
    func bind(to connectionAPI: ConnectionAPI) throws {
        connectionAPI.bind(importedService: serverService)
    }
    
    func register(with connectionAPI: ConnectionAPI) throws {}
    
    func send(_ request: ClientRequest, completion: @escaping (ClientResponse) throws -> Void) throws {
        Log.debug("Sending Client Request", domain: .gamesUtilities)
        try client.connectionAPI.call(GameUtilitiesService.Method.processClientRequest, message: request) { (packet) in
            Log.debug("Received client response", domain: .gamesUtilities)
            let response: ClientResponse = try packet.extract()
            try completion(response)
        }
    }
    
    func getAllValues(for attribute: Attribute, completion: @escaping ([Variant]) -> Void) throws {
        var request = GetAllValuesForAttributeRequest()
        request.attributeKey = attribute.name
        
        try self.client.connectionAPI.call(GameUtilitiesService.Method.getAllValuesForAttribute, message: request) { (packet) in
            let response: GetAllValuesForAttributeResponse = try packet.extract()
            completion(response.attributeValue)
        }
    }
}
