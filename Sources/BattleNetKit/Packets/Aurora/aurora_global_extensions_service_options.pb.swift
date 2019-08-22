// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/global_extensions/service_options.proto
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

public struct Bgs_Protocol_BGSServiceOptions: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".BGSServiceOptions"

  public var descriptorName: String {
    get {return _descriptorName ?? String()}
    set {_descriptorName = newValue}
  }
  /// Returns true if `descriptorName` has been explicitly set.
  public var hasDescriptorName: Bool {return self._descriptorName != nil}
  /// Clears the value of `descriptorName`. Subsequent reads from it will return its default value.
  public mutating func clearDescriptorName() {self._descriptorName = nil}

  public var version: UInt32 {
    get {return _version ?? 0}
    set {_version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  public var hasVersion: Bool {return self._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  public mutating func clearVersion() {self._version = nil}

  public var shardName: String {
    get {return _shardName ?? String()}
    set {_shardName = newValue}
  }
  /// Returns true if `shardName` has been explicitly set.
  public var hasShardName: Bool {return self._shardName != nil}
  /// Clears the value of `shardName`. Subsequent reads from it will return its default value.
  public mutating func clearShardName() {self._shardName = nil}

  public var resolveClientInstance: Bool {
    get {return _resolveClientInstance ?? false}
    set {_resolveClientInstance = newValue}
  }
  /// Returns true if `resolveClientInstance` has been explicitly set.
  public var hasResolveClientInstance: Bool {return self._resolveClientInstance != nil}
  /// Clears the value of `resolveClientInstance`. Subsequent reads from it will return its default value.
  public mutating func clearResolveClientInstance() {self._resolveClientInstance = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self._descriptorName)
      case 4: try decoder.decodeSingularUInt32Field(value: &self._version)
      case 5: try decoder.decodeSingularStringField(value: &self._shardName)
      case 6: try decoder.decodeSingularBoolField(value: &self._resolveClientInstance)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._descriptorName {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }
    if let v = self._version {
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 4)
    }
    if let v = self._shardName {
      try visitor.visitSingularStringField(value: v, fieldNumber: 5)
    }
    if let v = self._resolveClientInstance {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _descriptorName: String? = nil
  fileprivate var _version: UInt32? = nil
  fileprivate var _shardName: String? = nil
  fileprivate var _resolveClientInstance: Bool? = nil
}

public struct Bgs_Protocol_SDKServiceOptions: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".SDKServiceOptions"

  public var inbound: Bool {
    get {return _inbound ?? false}
    set {_inbound = newValue}
  }
  /// Returns true if `inbound` has been explicitly set.
  public var hasInbound: Bool {return self._inbound != nil}
  /// Clears the value of `inbound`. Subsequent reads from it will return its default value.
  public mutating func clearInbound() {self._inbound = nil}

  public var outbound: Bool {
    get {return _outbound ?? false}
    set {_outbound = newValue}
  }
  /// Returns true if `outbound` has been explicitly set.
  public var hasOutbound: Bool {return self._outbound != nil}
  /// Clears the value of `outbound`. Subsequent reads from it will return its default value.
  public mutating func clearOutbound() {self._outbound = nil}

  public var useClientID: Bool {
    get {return _useClientID ?? false}
    set {_useClientID = newValue}
  }
  /// Returns true if `useClientID` has been explicitly set.
  public var hasUseClientID: Bool {return self._useClientID != nil}
  /// Clears the value of `useClientID`. Subsequent reads from it will return its default value.
  public mutating func clearUseClientID() {self._useClientID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self._inbound)
      case 2: try decoder.decodeSingularBoolField(value: &self._outbound)
      case 3: try decoder.decodeSingularBoolField(value: &self._useClientID)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._inbound {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 1)
    }
    if let v = self._outbound {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 2)
    }
    if let v = self._useClientID {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _inbound: Bool? = nil
  fileprivate var _outbound: Bool? = nil
  fileprivate var _useClientID: Bool? = nil
}

// MARK: - Extension support defined in service_options.proto.

extension Google_Protobuf_ServiceOptions {

  public var Bgs_Protocol_serviceOptions: Bgs_Protocol_BGSServiceOptions {
    get {return getExtensionValue(ext: Bgs_Protocol_Extensions_service_options) ?? Bgs_Protocol_BGSServiceOptions()}
    set {setExtensionValue(ext: Bgs_Protocol_Extensions_service_options, value: newValue)}
  }
  /// Returns true if extension `Bgs_Protocol_Extensions_service_options`
  /// has been explicitly set.
  public var hasBgs_Protocol_serviceOptions: Bool {
    return hasExtensionValue(ext: Bgs_Protocol_Extensions_service_options)
  }
  /// Clears the value of extension `Bgs_Protocol_Extensions_service_options`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearBgs_Protocol_serviceOptions() {
    clearExtensionValue(ext: Bgs_Protocol_Extensions_service_options)
  }

  public var Bgs_Protocol_sdkServiceOptions: Bgs_Protocol_SDKServiceOptions {
    get {return getExtensionValue(ext: Bgs_Protocol_Extensions_sdk_service_options) ?? Bgs_Protocol_SDKServiceOptions()}
    set {setExtensionValue(ext: Bgs_Protocol_Extensions_sdk_service_options, value: newValue)}
  }
  /// Returns true if extension `Bgs_Protocol_Extensions_sdk_service_options`
  /// has been explicitly set.
  public var hasBgs_Protocol_sdkServiceOptions: Bool {
    return hasExtensionValue(ext: Bgs_Protocol_Extensions_sdk_service_options)
  }
  /// Clears the value of extension `Bgs_Protocol_Extensions_sdk_service_options`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearBgs_Protocol_sdkServiceOptions() {
    clearExtensionValue(ext: Bgs_Protocol_Extensions_sdk_service_options)
  }

}

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Bgs_Protocol_ServiceOptions_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Bgs_Protocol_Extensions_service_options,
  Bgs_Protocol_Extensions_sdk_service_options
]

let Bgs_Protocol_Extensions_service_options = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Bgs_Protocol_BGSServiceOptions>, Google_Protobuf_ServiceOptions>(
  _protobuf_fieldNumber: 90000,
  fieldName: "bgs.protocol.service_options"
)

let Bgs_Protocol_Extensions_sdk_service_options = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Bgs_Protocol_SDKServiceOptions>, Google_Protobuf_ServiceOptions>(
  _protobuf_fieldNumber: 90001,
  fieldName: "bgs.protocol.sdk_service_options"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol"

extension Bgs_Protocol_BGSServiceOptions: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "descriptor_name"),
    4: .same(proto: "version"),
    5: .standard(proto: "shard_name"),
    6: .standard(proto: "resolve_client_instance"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_BGSServiceOptions) -> Bool {
    if self._descriptorName != other._descriptorName {return false}
    if self._version != other._version {return false}
    if self._shardName != other._shardName {return false}
    if self._resolveClientInstance != other._resolveClientInstance {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_SDKServiceOptions: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "inbound"),
    2: .same(proto: "outbound"),
    3: .standard(proto: "use_client_id"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_SDKServiceOptions) -> Bool {
    if self._inbound != other._inbound {return false}
    if self._outbound != other._outbound {return false}
    if self._useClientID != other._useClientID {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}