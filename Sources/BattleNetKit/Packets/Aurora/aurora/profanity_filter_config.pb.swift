// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/profanity_filter_config.proto
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

public struct Bgs_Protocol_Profanity_V1_WordFilter: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".WordFilter"

  public var type: String {
    get {return _type ?? String()}
    set {_type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  public var hasType: Bool {return self._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  public mutating func clearType() {self._type = nil}

  public var regex: String {
    get {return _regex ?? String()}
    set {_regex = newValue}
  }
  /// Returns true if `regex` has been explicitly set.
  public var hasRegex: Bool {return self._regex != nil}
  /// Clears the value of `regex`. Subsequent reads from it will return its default value.
  public mutating func clearRegex() {self._regex = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    if self._type == nil {return false}
    if self._regex == nil {return false}
    return true
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self._type)
      case 2: try decoder.decodeSingularStringField(value: &self._regex)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._type {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }
    if let v = self._regex {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _type: String? = nil
  fileprivate var _regex: String? = nil
}

public struct Bgs_Protocol_Profanity_V1_WordFilters: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".WordFilters"

  public var filters: [Bgs_Protocol_Profanity_V1_WordFilter] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    if !SwiftProtobuf.Internal.areAllInitialized(self.filters) {return false}
    return true
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.filters)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.filters.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.filters, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol.profanity.v1"

extension Bgs_Protocol_Profanity_V1_WordFilter: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "type"),
    2: .same(proto: "regex"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_Profanity_V1_WordFilter) -> Bool {
    if self._type != other._type {return false}
    if self._regex != other._regex {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Profanity_V1_WordFilters: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "filters"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_Profanity_V1_WordFilters) -> Bool {
    if self.filters != other.filters {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
