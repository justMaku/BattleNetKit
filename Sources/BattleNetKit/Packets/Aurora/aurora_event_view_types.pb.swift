// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/event_view_types.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public enum Bgs_Protocol_EventOrder: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case eventDescending // = 0
  case eventAscending // = 1

  public init() {
    self = .eventDescending
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .eventDescending
    case 1: self = .eventAscending
    default: return nil
    }
  }

  public var rawValue: Int {
    switch self {
    case .eventDescending: return 0
    case .eventAscending: return 1
    }
  }

}

public struct Bgs_Protocol_GetEventOptions: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".GetEventOptions"

  public var fetchFrom: UInt64 {
    get {return _fetchFrom ?? 0}
    set {_fetchFrom = newValue}
  }
  /// Returns true if `fetchFrom` has been explicitly set.
  public var hasFetchFrom: Bool {return self._fetchFrom != nil}
  /// Clears the value of `fetchFrom`. Subsequent reads from it will return its default value.
  public mutating func clearFetchFrom() {self._fetchFrom = nil}

  public var fetchUntil: UInt64 {
    get {return _fetchUntil ?? 0}
    set {_fetchUntil = newValue}
  }
  /// Returns true if `fetchUntil` has been explicitly set.
  public var hasFetchUntil: Bool {return self._fetchUntil != nil}
  /// Clears the value of `fetchUntil`. Subsequent reads from it will return its default value.
  public mutating func clearFetchUntil() {self._fetchUntil = nil}

  public var maxEvents: UInt32 {
    get {return _maxEvents ?? 0}
    set {_maxEvents = newValue}
  }
  /// Returns true if `maxEvents` has been explicitly set.
  public var hasMaxEvents: Bool {return self._maxEvents != nil}
  /// Clears the value of `maxEvents`. Subsequent reads from it will return its default value.
  public mutating func clearMaxEvents() {self._maxEvents = nil}

  public var order: Bgs_Protocol_EventOrder {
    get {return _order ?? .eventDescending}
    set {_order = newValue}
  }
  /// Returns true if `order` has been explicitly set.
  public var hasOrder: Bool {return self._order != nil}
  /// Clears the value of `order`. Subsequent reads from it will return its default value.
  public mutating func clearOrder() {self._order = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self._fetchFrom)
      case 2: try decoder.decodeSingularUInt64Field(value: &self._fetchUntil)
      case 3: try decoder.decodeSingularUInt32Field(value: &self._maxEvents)
      case 4: try decoder.decodeSingularEnumField(value: &self._order)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._fetchFrom {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 1)
    }
    if let v = self._fetchUntil {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
    }
    if let v = self._maxEvents {
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 3)
    }
    if let v = self._order {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _fetchFrom: UInt64? = nil
  fileprivate var _fetchUntil: UInt64? = nil
  fileprivate var _maxEvents: UInt32? = nil
  fileprivate var _order: Bgs_Protocol_EventOrder? = nil
}

public struct Bgs_Protocol_ViewMarker: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".ViewMarker"

  public var lastReadTime: UInt64 {
    get {return _lastReadTime ?? 0}
    set {_lastReadTime = newValue}
  }
  /// Returns true if `lastReadTime` has been explicitly set.
  public var hasLastReadTime: Bool {return self._lastReadTime != nil}
  /// Clears the value of `lastReadTime`. Subsequent reads from it will return its default value.
  public mutating func clearLastReadTime() {self._lastReadTime = nil}

  public var lastMessageTime: UInt64 {
    get {return _lastMessageTime ?? 0}
    set {_lastMessageTime = newValue}
  }
  /// Returns true if `lastMessageTime` has been explicitly set.
  public var hasLastMessageTime: Bool {return self._lastMessageTime != nil}
  /// Clears the value of `lastMessageTime`. Subsequent reads from it will return its default value.
  public mutating func clearLastMessageTime() {self._lastMessageTime = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self._lastReadTime)
      case 2: try decoder.decodeSingularUInt64Field(value: &self._lastMessageTime)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._lastReadTime {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 1)
    }
    if let v = self._lastMessageTime {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _lastReadTime: UInt64? = nil
  fileprivate var _lastMessageTime: UInt64? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol"

extension Bgs_Protocol_EventOrder: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "EVENT_DESCENDING"),
    1: .same(proto: "EVENT_ASCENDING"),
  ]
}

extension Bgs_Protocol_GetEventOptions: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "fetch_from"),
    2: .standard(proto: "fetch_until"),
    3: .standard(proto: "max_events"),
    4: .same(proto: "order"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_GetEventOptions) -> Bool {
    if self._fetchFrom != other._fetchFrom {return false}
    if self._fetchUntil != other._fetchUntil {return false}
    if self._maxEvents != other._maxEvents {return false}
    if self._order != other._order {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_ViewMarker: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "last_read_time"),
    2: .standard(proto: "last_message_time"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_ViewMarker) -> Bool {
    if self._lastReadTime != other._lastReadTime {return false}
    if self._lastMessageTime != other._lastMessageTime {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}