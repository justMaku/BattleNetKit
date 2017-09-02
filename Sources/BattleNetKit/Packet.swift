//
//  Packet.swift
//  Ostara
//
//  Created by Michał Kałużny on 12/09/2016.
//
//

import Foundation

struct Packet {
    let header: Header
    let message: Message?
    
    func encode() throws -> Data {
        
        let headerData = try header.serializedData()
        let messageData = try message?.serializedData()
        
        let headerSize = headerData.count        
        let sizeBytes: [UInt8] = [
            UInt8(headerSize) >> 8 & 255,
            UInt8(headerSize) & 255
        ]
        
        let sizeData = Data(bytes: sizeBytes)
        
        return sizeData + headerData + (messageData ?? Data())
    }
}
