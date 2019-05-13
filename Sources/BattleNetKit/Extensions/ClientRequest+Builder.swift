import Foundation

typealias Variant = Bgs_Protocol_Variant

extension Bgs_Protocol_GameUtilities_V1_ClientRequest {
    init(command: String, value: Variantable? = nil, version: Bgs_Protocol_Attribute.Version = .live, parameters: [Bgs_Protocol_Attribute]) throws {
        self.init()

        let commandAttribute = try Bgs_Protocol_Attribute(command: command, value: value, version: version)
        self.attribute = [commandAttribute]
        self.attribute.append(contentsOf: parameters)
    }
}

extension Collection where Self.Element == Bgs_Protocol_Attribute {
    subscript(index: String) -> Bgs_Protocol_Attribute? {
        return self.filter { $0.name == index }.first
    }
}

extension Bgs_Protocol_Attribute {
    enum Version: String {
        case live = "b9"
        case classic = "c1"
    }

    var isCommand: Bool {
        return self.name.starts(with: "Command_")
    }

    var isParameter: Bool {
        return self.name.starts(with: "Param_")
    }

    init(command: String, value: Variantable? = nil, version: Version = .live) throws {
        self.init()

        self.name = "Command_\(command)_v1_\(version.rawValue)"

        if let value = value {
            self.value = try Variant(value)
        } else {
            self.value = try Variant(0)
        }
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

    public func jamValue<T>(of type: T.Type) throws -> T where T: Decodable {
        let data = try self.blobValue.advanced(by: 4).decode()

        let decoder = JSONDecoder()

        let name = String(describing: T.self) + ":"
        let json = data
            .prefix(upTo: data.count - 1) // Get rid of \0 at the end
            .advanced(by: name.count) // Get rid of T: at the beginning

        return try decoder.decode(T.self, from: json)
    }
}

public protocol Variantable {}
extension Bool: Variantable {}
extension Int64: Variantable {}
extension Double: Variantable {}
extension String: Variantable {}
extension UInt64: Variantable {}
extension Data: Variantable {}
