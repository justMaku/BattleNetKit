// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ChallengeExternalRequest.proto
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

public struct ChallengeExternalRequest: SwiftProtobuf.Message {
  public static let protoMessageName: String = "ChallengeExternalRequest"

  public var requestToken: String {
    get {return _requestToken ?? String()}
    set {_requestToken = newValue}
  }
  /// Returns true if `requestToken` has been explicitly set.
  public var hasRequestToken: Bool {return self._requestToken != nil}
  /// Clears the value of `requestToken`. Subsequent reads from it will return its default value.
  public mutating func clearRequestToken() {self._requestToken = nil}

  public var payloadType: String {
    get {return _payloadType ?? String()}
    set {_payloadType = newValue}
  }
  /// Returns true if `payloadType` has been explicitly set.
  public var hasPayloadType: Bool {return self._payloadType != nil}
  /// Clears the value of `payloadType`. Subsequent reads from it will return its default value.
  public mutating func clearPayloadType() {self._payloadType = nil}

  public var payload: Data {
    get {return _payload ?? SwiftProtobuf.Internal.emptyData}
    set {_payload = newValue}
  }
  /// Returns true if `payload` has been explicitly set.
  public var hasPayload: Bool {return self._payload != nil}
  /// Clears the value of `payload`. Subsequent reads from it will return its default value.
  public mutating func clearPayload() {self._payload = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self._requestToken)
      case 2: try decoder.decodeSingularStringField(value: &self._payloadType)
      case 3: try decoder.decodeSingularBytesField(value: &self._payload)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._requestToken {
      try visitor.visitSingularStringField(value: v, fieldNumber: 1)
    }
    if let v = self._payloadType {
      try visitor.visitSingularStringField(value: v, fieldNumber: 2)
    }
    if let v = self._payload {
      try visitor.visitSingularBytesField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _requestToken: String? = nil
  fileprivate var _payloadType: String? = nil
  fileprivate var _payload: Data? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ChallengeExternalRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "request_token"),
    2: .standard(proto: "payload_type"),
    3: .same(proto: "payload"),
  ]

  public func _protobuf_generated_isEqualTo(other: ChallengeExternalRequest) -> Bool {
    if self._requestToken != other._requestToken {return false}
    if self._payloadType != other._payloadType {return false}
    if self._payload != other._payload {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
