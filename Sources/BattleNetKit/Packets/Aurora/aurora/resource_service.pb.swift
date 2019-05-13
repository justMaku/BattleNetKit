// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/resource_service.proto
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

public struct Bgs_Protocol_Resources_V1_ContentHandleRequest: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".ContentHandleRequest"

  public var program: UInt32 {
    get {return _program ?? 0}
    set {_program = newValue}
  }
  /// Returns true if `program` has been explicitly set.
  public var hasProgram: Bool {return self._program != nil}
  /// Clears the value of `program`. Subsequent reads from it will return its default value.
  public mutating func clearProgram() {self._program = nil}

  public var stream: UInt32 {
    get {return _stream ?? 0}
    set {_stream = newValue}
  }
  /// Returns true if `stream` has been explicitly set.
  public var hasStream: Bool {return self._stream != nil}
  /// Clears the value of `stream`. Subsequent reads from it will return its default value.
  public mutating func clearStream() {self._stream = nil}

  public var version: UInt32 {
    get {return _version ?? 1701729619}
    set {_version = newValue}
  }
  /// Returns true if `version` has been explicitly set.
  public var hasVersion: Bool {return self._version != nil}
  /// Clears the value of `version`. Subsequent reads from it will return its default value.
  public mutating func clearVersion() {self._version = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    if self._program == nil {return false}
    if self._stream == nil {return false}
    return true
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularFixed32Field(value: &self._program)
      case 2: try decoder.decodeSingularFixed32Field(value: &self._stream)
      case 3: try decoder.decodeSingularFixed32Field(value: &self._version)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._program {
      try visitor.visitSingularFixed32Field(value: v, fieldNumber: 1)
    }
    if let v = self._stream {
      try visitor.visitSingularFixed32Field(value: v, fieldNumber: 2)
    }
    if let v = self._version {
      try visitor.visitSingularFixed32Field(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _program: UInt32? = nil
  fileprivate var _stream: UInt32? = nil
  fileprivate var _version: UInt32? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol.resources.v1"

extension Bgs_Protocol_Resources_V1_ContentHandleRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "program"),
    2: .same(proto: "stream"),
    3: .same(proto: "version"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_Resources_V1_ContentHandleRequest) -> Bool {
    if self._program != other._program {return false}
    if self._stream != other._stream {return false}
    if self._version != other._version {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
