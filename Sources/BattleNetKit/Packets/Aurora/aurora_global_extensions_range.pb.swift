// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/global_extensions/range.proto
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

public struct Bgs_Protocol_UnsignedIntRange {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var min: UInt64 {
    get {return _min ?? 0}
    set {_min = newValue}
  }
  /// Returns true if `min` has been explicitly set.
  public var hasMin: Bool {return self._min != nil}
  /// Clears the value of `min`. Subsequent reads from it will return its default value.
  public mutating func clearMin() {self._min = nil}

  public var max: UInt64 {
    get {return _max ?? 0}
    set {_max = newValue}
  }
  /// Returns true if `max` has been explicitly set.
  public var hasMax: Bool {return self._max != nil}
  /// Clears the value of `max`. Subsequent reads from it will return its default value.
  public mutating func clearMax() {self._max = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _min: UInt64? = nil
  fileprivate var _max: UInt64? = nil
}

public struct Bgs_Protocol_SignedIntRange {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var min: Int64 {
    get {return _min ?? 0}
    set {_min = newValue}
  }
  /// Returns true if `min` has been explicitly set.
  public var hasMin: Bool {return self._min != nil}
  /// Clears the value of `min`. Subsequent reads from it will return its default value.
  public mutating func clearMin() {self._min = nil}

  public var max: Int64 {
    get {return _max ?? 0}
    set {_max = newValue}
  }
  /// Returns true if `max` has been explicitly set.
  public var hasMax: Bool {return self._max != nil}
  /// Clears the value of `max`. Subsequent reads from it will return its default value.
  public mutating func clearMax() {self._max = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _min: Int64? = nil
  fileprivate var _max: Int64? = nil
}

public struct Bgs_Protocol_FloatRange {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var min: Float {
    get {return _min ?? 0}
    set {_min = newValue}
  }
  /// Returns true if `min` has been explicitly set.
  public var hasMin: Bool {return self._min != nil}
  /// Clears the value of `min`. Subsequent reads from it will return its default value.
  public mutating func clearMin() {self._min = nil}

  public var max: Float {
    get {return _max ?? 0}
    set {_max = newValue}
  }
  /// Returns true if `max` has been explicitly set.
  public var hasMax: Bool {return self._max != nil}
  /// Clears the value of `max`. Subsequent reads from it will return its default value.
  public mutating func clearMax() {self._max = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _min: Float? = nil
  fileprivate var _max: Float? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol"

extension Bgs_Protocol_UnsignedIntRange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".UnsignedIntRange"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "min"),
    2: .same(proto: "max"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularUInt64Field(value: &self._min)
      case 2: try decoder.decodeSingularUInt64Field(value: &self._max)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._min {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 1)
    }
    if let v = self._max {
      try visitor.visitSingularUInt64Field(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_UnsignedIntRange, rhs: Bgs_Protocol_UnsignedIntRange) -> Bool {
    if lhs._min != rhs._min {return false}
    if lhs._max != rhs._max {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_SignedIntRange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SignedIntRange"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "min"),
    2: .same(proto: "max"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt64Field(value: &self._min)
      case 2: try decoder.decodeSingularInt64Field(value: &self._max)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._min {
      try visitor.visitSingularInt64Field(value: v, fieldNumber: 1)
    }
    if let v = self._max {
      try visitor.visitSingularInt64Field(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_SignedIntRange, rhs: Bgs_Protocol_SignedIntRange) -> Bool {
    if lhs._min != rhs._min {return false}
    if lhs._max != rhs._max {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_FloatRange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".FloatRange"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "min"),
    2: .same(proto: "max"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularFloatField(value: &self._min)
      case 2: try decoder.decodeSingularFloatField(value: &self._max)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._min {
      try visitor.visitSingularFloatField(value: v, fieldNumber: 1)
    }
    if let v = self._max {
      try visitor.visitSingularFloatField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_FloatRange, rhs: Bgs_Protocol_FloatRange) -> Bool {
    if lhs._min != rhs._min {return false}
    if lhs._max != rhs._max {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
