// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/global_extensions/message_options.proto
//
// For information on using the generated types, please see the documentation:
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

public struct Bgs_Protocol_BGSMessageOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var customSelectShard: Bool {
    get {return _customSelectShard ?? false}
    set {_customSelectShard = newValue}
  }
  /// Returns true if `customSelectShard` has been explicitly set.
  public var hasCustomSelectShard: Bool {return self._customSelectShard != nil}
  /// Clears the value of `customSelectShard`. Subsequent reads from it will return its default value.
  public mutating func clearCustomSelectShard() {self._customSelectShard = nil}

  public var customValidator: Bool {
    get {return _customValidator ?? false}
    set {_customValidator = newValue}
  }
  /// Returns true if `customValidator` has been explicitly set.
  public var hasCustomValidator: Bool {return self._customValidator != nil}
  /// Clears the value of `customValidator`. Subsequent reads from it will return its default value.
  public mutating func clearCustomValidator() {self._customValidator = nil}

  public var clientIDFanout: Bool {
    get {return _clientIDFanout ?? false}
    set {_clientIDFanout = newValue}
  }
  /// Returns true if `clientIDFanout` has been explicitly set.
  public var hasClientIDFanout: Bool {return self._clientIDFanout != nil}
  /// Clears the value of `clientIDFanout`. Subsequent reads from it will return its default value.
  public mutating func clearClientIDFanout() {self._clientIDFanout = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _customSelectShard: Bool? = nil
  fileprivate var _customValidator: Bool? = nil
  fileprivate var _clientIDFanout: Bool? = nil
}

// MARK: - Extension support defined in message_options.proto.

extension SwiftProtobuf.Google_Protobuf_MessageOptions {

  public var Bgs_Protocol_messageOptions: Bgs_Protocol_BGSMessageOptions {
    get {return getExtensionValue(ext: Bgs_Protocol_Extensions_message_options) ?? Bgs_Protocol_BGSMessageOptions()}
    set {setExtensionValue(ext: Bgs_Protocol_Extensions_message_options, value: newValue)}
  }
  /// Returns true if extension `Bgs_Protocol_Extensions_message_options`
  /// has been explicitly set.
  public var hasBgs_Protocol_messageOptions: Bool {
    return hasExtensionValue(ext: Bgs_Protocol_Extensions_message_options)
  }
  /// Clears the value of extension `Bgs_Protocol_Extensions_message_options`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearBgs_Protocol_messageOptions() {
    clearExtensionValue(ext: Bgs_Protocol_Extensions_message_options)
  }

}

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Bgs_Protocol_MessageOptions_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Bgs_Protocol_Extensions_message_options
]

let Bgs_Protocol_Extensions_message_options = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Bgs_Protocol_BGSMessageOptions>, SwiftProtobuf.Google_Protobuf_MessageOptions>(
  _protobuf_fieldNumber: 90000,
  fieldName: "bgs.protocol.message_options"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol"

extension Bgs_Protocol_BGSMessageOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BGSMessageOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "custom_select_shard"),
    2: .standard(proto: "custom_validator"),
    3: .standard(proto: "client_id_fanout"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self._customSelectShard)
      case 2: try decoder.decodeSingularBoolField(value: &self._customValidator)
      case 3: try decoder.decodeSingularBoolField(value: &self._clientIDFanout)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._customSelectShard {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 1)
    }
    if let v = self._customValidator {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 2)
    }
    if let v = self._clientIDFanout {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_BGSMessageOptions, rhs: Bgs_Protocol_BGSMessageOptions) -> Bool {
    if lhs._customSelectShard != rhs._customSelectShard {return false}
    if lhs._customValidator != rhs._customValidator {return false}
    if lhs._clientIDFanout != rhs._clientIDFanout {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
