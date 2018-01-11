//
//  GameUtilitiesAPI.swift
//  BattleNetKitSamplePackageDescription
//
//  Created by Michał Kałużny on 06.12.17.
//

import Foundation
import Result

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
    
    func send(_ request: ClientRequest, completion: @escaping (Result<ClientResponse, Connection.Error>) throws -> Void) throws {
        Log.debug("Sending Client Request", domain: .gamesUtilities)
        try client.connectionAPI.call(GameUtilitiesService.Method.processClientRequest, message: request) { result in
            Log.debug("Received client response", domain: .gamesUtilities)

            do {
                let response = try result.dematerialize().extract() as ClientResponse
                try completion(Result(value: response))
            } catch let error as Connection.Error {
                try completion(Result(error: error))
            } catch let error {
                throw error
            }
        }
    }
    
    func getAllValues(for attribute: Attribute, completion: @escaping (Result<[Variant], Connection.Error>) throws -> Void) throws {
        var request = GetAllValuesForAttributeRequest()
        request.attributeKey = attribute.name
        
        try self.client.connectionAPI.call(GameUtilitiesService.Method.getAllValuesForAttribute, message: request) { (result) in
            
            do {
                let response = try result.dematerialize().extract() as GetAllValuesForAttributeResponse
                try completion(Result(value: response.attributeValue))
            } catch let error as Connection.Error {
                try completion(Result(error: error))
            } catch let error {
                throw error
            }
        }
    }
}
