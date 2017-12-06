//
//  API.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 06.12.17.
//

import Foundation

protocol API {
    init(client: BattleNet)
    func bind(to connectionAPI: ConnectionAPI) throws
    func register(with connectionAPI: ConnectionAPI) throws
}
