// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/message_types.proto
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

public enum Bgs_Protocol_TypingIndicator: SwiftProtobuf.Enum {
  public typealias RawValue = Int
  case typingStart // = 0
  case typingStop // = 1

  public init() {
    self = .typingStart
  }

  public init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .typingStart
    case 1: self = .typingStop
    default: return nil
    }
  }

  public var rawValue: Int {
    switch self {
    case .typingStart: return 0
    case .typingStop: return 1
    }
  }

}

public struct Bgs_Protocol_MessageId: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".MessageId"

  public var epoch: UInt64 {
    get {return _epoch ?? 0}
    set {_epoch = newValue}
  }
  /// Returns true if `epoch` has been explicitly set.
  public var hasEpoch: Bool {return self._epoch != nil}
  /// Clears the value of `epoch`. Subsequent reads from it will return its default value.
  public mutating func clearEpoch() {self._epoch = nil}

  public var position: UInt64 {
    get {return _position ?? 0}
    set {_position = newValue}
  }
  /// Returns true if `position` has been explicitly set.
  public var hasPosition: Bool {return self._position != nil}
  /// Clears the value of `position`. Subsequent reads from it will return its default value.
  public mutating func clearPosition() {self._position = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self._epoch)
      case 2: try decoder.decodeSingularUInt64Field(value: &self._position)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._epoch {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 1)
    }
    if let v = self._position {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _epoch: UInt64? = nil
  fileprivate var _position: UInt64? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol"

extension Bgs_Protocol_TypingIndicator: SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "TYPING_START"),
    1: .same(proto: "TYPING_STOP"),
  ]
}

extension Bgs_Protocol_MessageId: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "epoch"),
    2: .same(proto: "position"),
  ]

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_MessageId) -> Bool {
    if self._epoch != other._epoch {return false}
    if self._position != other._position {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}