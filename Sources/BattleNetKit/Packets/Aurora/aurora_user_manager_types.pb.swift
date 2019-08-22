// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/user_manager_types.proto
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

public struct Bgs_Protocol_UserManager_V1_RecentPlayer: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".RecentPlayer"

  public var entityID: Bgs_Protocol_EntityId {
    get {return _storage._entityID ?? Bgs_Protocol_EntityId()}
    set {_uniqueStorage()._entityID = newValue}
  }
  /// Returns true if `entityID` has been explicitly set.
  public var hasEntityID: Bool {return _storage._entityID != nil}
  /// Clears the value of `entityID`. Subsequent reads from it will return its default value.
  public mutating func clearEntityID() {_storage._entityID = nil}

  public var program: String {
    get {return _storage._program ?? String()}
    set {_uniqueStorage()._program = newValue}
  }
  /// Returns true if `program` has been explicitly set.
  public var hasProgram: Bool {return _storage._program != nil}
  /// Clears the value of `program`. Subsequent reads from it will return its default value.
  public mutating func clearProgram() {_storage._program = nil}

  public var timestampPlayed: UInt64 {
    get {return _storage._timestampPlayed ?? 0}
    set {_uniqueStorage()._timestampPlayed = newValue}
  }
  /// Returns true if `timestampPlayed` has been explicitly set.
  public var hasTimestampPlayed: Bool {return _storage._timestampPlayed != nil}
  /// Clears the value of `timestampPlayed`. Subsequent reads from it will return its default value.
  public mutating func clearTimestampPlayed() {_storage._timestampPlayed = nil}

  public var attributes: [Bgs_Protocol_Attribute] {
    get {return _storage._attributes}
    set {_uniqueStorage()._attributes = newValue}
  }

  public var id: UInt32 {
    get {return _storage._id ?? 0}
    set {_uniqueStorage()._id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  public var hasID: Bool {return _storage._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  public mutating func clearID() {_storage._id = nil}

  public var counter: UInt32 {
    get {return _storage._counter ?? 0}
    set {_uniqueStorage()._counter = newValue}
  }
  /// Returns true if `counter` has been explicitly set.
  public var hasCounter: Bool {return _storage._counter != nil}
  /// Clears the value of `counter`. Subsequent reads from it will return its default value.
  public mutating func clearCounter() {_storage._counter = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._entityID == nil {return false}
      if let v = _storage._entityID, !v.isInitialized {return false}
      if !SwiftProtobuf.Internal.areAllInitialized(_storage._attributes) {return false}
      return true
    }
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._entityID)
        case 2: try decoder.decodeSingularStringField(value: &_storage._program)
        case 3: try decoder.decodeSingularFixed64Field(value: &_storage._timestampPlayed)
        case 4: try decoder.decodeRepeatedMessageField(value: &_storage._attributes)
        case 5: try decoder.decodeSingularFixed32Field(value: &_storage._id)
        case 6: try decoder.decodeSingularFixed32Field(value: &_storage._counter)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._entityID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._program {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
      if let v = _storage._timestampPlayed {
        try visitor.visitSingularFixed64Field(value: v, fieldNumber: 3)
      }
      if !_storage._attributes.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._attributes, fieldNumber: 4)
      }
      if let v = _storage._id {
        try visitor.visitSingularFixed32Field(value: v, fieldNumber: 5)
      }
      if let v = _storage._counter {
        try visitor.visitSingularFixed32Field(value: v, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_UserManager_V1_BlockedPlayer: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".BlockedPlayer"

  public var accountID: Bgs_Protocol_EntityId {
    get {return _storage._accountID ?? Bgs_Protocol_EntityId()}
    set {_uniqueStorage()._accountID = newValue}
  }
  /// Returns true if `accountID` has been explicitly set.
  public var hasAccountID: Bool {return _storage._accountID != nil}
  /// Clears the value of `accountID`. Subsequent reads from it will return its default value.
  public mutating func clearAccountID() {_storage._accountID = nil}

  public var name: String {
    get {return _storage._name ?? String()}
    set {_uniqueStorage()._name = newValue}
  }
  /// Returns true if `name` has been explicitly set.
  public var hasName: Bool {return _storage._name != nil}
  /// Clears the value of `name`. Subsequent reads from it will return its default value.
  public mutating func clearName() {_storage._name = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._accountID == nil {return false}
      if let v = _storage._accountID, !v.isInitialized {return false}
      return true
    }
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._accountID)
        case 2: try decoder.decodeSingularStringField(value: &_storage._name)
        default: break
        }
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._accountID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._name {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol.user_manager.v1"

extension Bgs_Protocol_UserManager_V1_RecentPlayer: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "entity_id"),
    2: .same(proto: "program"),
    3: .standard(proto: "timestamp_played"),
    4: .same(proto: "attributes"),
    5: .same(proto: "id"),
    6: .same(proto: "counter"),
  ]

  fileprivate class _StorageClass {
    var _entityID: Bgs_Protocol_EntityId? = nil
    var _program: String? = nil
    var _timestampPlayed: UInt64? = nil
    var _attributes: [Bgs_Protocol_Attribute] = []
    var _id: UInt32? = nil
    var _counter: UInt32? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _entityID = source._entityID
      _program = source._program
      _timestampPlayed = source._timestampPlayed
      _attributes = source._attributes
      _id = source._id
      _counter = source._counter
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_UserManager_V1_RecentPlayer) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._entityID != other_storage._entityID {return false}
        if _storage._program != other_storage._program {return false}
        if _storage._timestampPlayed != other_storage._timestampPlayed {return false}
        if _storage._attributes != other_storage._attributes {return false}
        if _storage._id != other_storage._id {return false}
        if _storage._counter != other_storage._counter {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_UserManager_V1_BlockedPlayer: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "account_id"),
    2: .same(proto: "name"),
  ]

  fileprivate class _StorageClass {
    var _accountID: Bgs_Protocol_EntityId? = nil
    var _name: String? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _accountID = source._accountID
      _name = source._name
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_UserManager_V1_BlockedPlayer) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._accountID != other_storage._accountID {return false}
        if _storage._name != other_storage._name {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}