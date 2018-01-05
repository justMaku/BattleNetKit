//
//  ClientRequest+Builder.swift
//  BattleNetKit
//
//  Created by Michał Kałuży on 27.11.17.
//

import Foundation

extension ClientRequest {
    init(command: String, parameters: [Attribute]) throws {
        self.init()
        
        let commandAttribute = try Attribute(command: command)
        self.attribute = [commandAttribute]
        self.attribute.append(contentsOf: parameters)
    }
}

extension Collection where Self.Element == Attribute {
    subscript(index: String) -> Attribute? {
        get {
            return self.filter { $0.name == index }.first
        }
    }
}

extension EntityId {
    var region: Region {
        let region = (UInt32)((self.high & 0xFF00000000) >> 32)
        return Region(rawValue: region) ?? .unknown
    }
}

extension Attribute {
    var isCommand: Bool {
        return self.name.starts(with: "Command_")
    }

    var isParameter: Bool {
        return self.name.starts(with: "Param_")
    }
    
    init(command: String) throws {
        self.init()
        
        self.name = "Command_\(command)_v1_b9"
        self.value = try Variant(0)
    }
    
    init(parameter: String) {
        self.init()
        self.name = "Param_\(parameter)"
    }
    
    init<T: Variantable>(parameter: String, value: T) throws {
        self.init(parameter: parameter)
        self.value = try Variant(value)
    }
    
    init(parameter: String, fourCC: String) throws {
        self.init(parameter: parameter)
        self.value = Variant(fourCC: fourCC)
    }
    
    init(parameter: String, message: Message) throws {
        self.init(parameter: parameter)
        self.value = try Variant(message: message)
    }
    
    init<T: Encodable>(parameter: String, jam: T) throws {
        self.init(parameter: parameter)

        let messageName = String(describing: T.self) + ":"
        let nameData = messageName.data(using: .ascii)!
        let messageData = try JSONEncoder().encode(jam)
        let trailingData = Data([0])
        
        let fullData = nameData + messageData + trailingData
        
        self.value = try Variant(fullData)
    }
}

extension Variant {
    public init(_ value: Variantable) throws {
        self.init()
        
        switch value {
        case is Bool:
            self.boolValue = value as! Bool
        case is Int64:
            self.intValue = value as! Int64
        case is Double:
            self.floatValue = value as! Double
        case is String:
            self.stringValue = value as! String
        case is Data:
            self.blobValue = value as! Data
        case is UInt64:
            self.uintValue = value as! UInt64
        default:
            break
        }
    }
    
    public init(message value: Message) throws {
        self.init()
        
        self.messageValue = try value.serializedData()
    }
    
    public init(fourCC value: String) {
        self.init()
        
        self.fourccValue = value
    }
}

public protocol Variantable {}
extension Bool: Variantable {}
extension Int64: Variantable {}
extension Double: Variantable {}
extension String: Variantable {}
extension UInt64: Variantable {}
extension Data: Variantable {}




