//
//  Message.swift
//  Ostara
//
//  Created by Michał Kałużny on 12/09/2016.
//
//

import SwiftProtobuf

protocol Message: SwiftProtobuf.Message {}

extension ConnectRequest: Message {}
extension ConnectResponse: Message {}
