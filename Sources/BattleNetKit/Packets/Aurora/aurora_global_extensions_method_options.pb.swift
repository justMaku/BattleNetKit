// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/global_extensions/method_options.proto
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

public struct Bgs_Protocol_BGSMethodOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var id: UInt32 {
    get {return _id ?? 0}
    set {_id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  public var hasID: Bool {return self._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  public mutating func clearID() {self._id = nil}

  public var clientIdentityRouting: Bgs_Protocol_ClientIdentityRoutingType {
    get {return _clientIdentityRouting ?? .clientIdentityRoutingDisabled}
    set {_clientIdentityRouting = newValue}
  }
  /// Returns true if `clientIdentityRouting` has been explicitly set.
  public var hasClientIdentityRouting: Bool {return self._clientIdentityRouting != nil}
  /// Clears the value of `clientIdentityRouting`. Subsequent reads from it will return its default value.
  public mutating func clearClientIdentityRouting() {self._clientIdentityRouting = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _id: UInt32? = nil
  fileprivate var _clientIdentityRouting: Bgs_Protocol_ClientIdentityRoutingType? = nil
}

// MARK: - Extension support defined in method_options.proto.

extension SwiftProtobuf.Google_Protobuf_MethodOptions {

  public var Bgs_Protocol_methodOptions: Bgs_Protocol_BGSMethodOptions {
    get {return getExtensionValue(ext: Bgs_Protocol_Extensions_method_options) ?? Bgs_Protocol_BGSMethodOptions()}
    set {setExtensionValue(ext: Bgs_Protocol_Extensions_method_options, value: newValue)}
  }
  /// Returns true if extension `Bgs_Protocol_Extensions_method_options`
  /// has been explicitly set.
  public var hasBgs_Protocol_methodOptions: Bool {
    return hasExtensionValue(ext: Bgs_Protocol_Extensions_method_options)
  }
  /// Clears the value of extension `Bgs_Protocol_Extensions_method_options`.
  /// Subsequent reads from it will return its default value.
  public mutating func clearBgs_Protocol_methodOptions() {
    clearExtensionValue(ext: Bgs_Protocol_Extensions_method_options)
  }

}

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Bgs_Protocol_MethodOptions_Extensions: SwiftProtobuf.SimpleExtensionMap = [
  Bgs_Protocol_Extensions_method_options
]

let Bgs_Protocol_Extensions_method_options = SwiftProtobuf.MessageExtension<SwiftProtobuf.OptionalMessageExtensionField<Bgs_Protocol_BGSMethodOptions>, SwiftProtobuf.Google_Protobuf_MethodOptions>(
  _protobuf_fieldNumber: 90000,
  fieldName: "bgs.protocol.method_options"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol"

extension Bgs_Protocol_BGSMethodOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".BGSMethodOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "client_identity_routing"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt32Field(value: &self._id)
      case 2: try decoder.decodeSingularEnumField(value: &self._clientIdentityRouting)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._id {
      try visitor.visitSingularUInt32Field(value: v, fieldNumber: 1)
    }
    if let v = self._clientIdentityRouting {
      try visitor.visitSingularEnumField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_BGSMethodOptions, rhs: Bgs_Protocol_BGSMethodOptions) -> Bool {
    if lhs._id != rhs._id {return false}
    if lhs._clientIdentityRouting != rhs._clientIdentityRouting {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
