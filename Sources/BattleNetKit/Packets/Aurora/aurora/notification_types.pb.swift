// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/notification_types.proto
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

public struct Bgs_Protocol_Notification_V1_Target: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".Target"

  public var identity: Bgs_Protocol_Account_V1_Identity {
    get {return _storage._identity ?? Bgs_Protocol_Account_V1_Identity()}
    set {_uniqueStorage()._identity = newValue}
  }
  /// Returns true if `identity` has been explicitly set.
  public var hasIdentity: Bool {return _storage._identity != nil}
  /// Clears the value of `identity`. Subsequent reads from it will return its default value.
  public mutating func clearIdentity() {_storage._identity = nil}

  public var type: String {
    get {return _storage._type ?? String()}
    set {_uniqueStorage()._type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  public var hasType: Bool {return _storage._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  public mutating func clearType() {_storage._type = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._identity, !v.isInitialized {return false}
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._identity)
        case 2: try decoder.decodeSingularStringField(value: &_storage._type)
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
      if let v = _storage._identity {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._type {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_Notification_V1_Subscription: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".Subscription"

  public var target: [Bgs_Protocol_Notification_V1_Target] {
    get {return _storage._target}
    set {_uniqueStorage()._target = newValue}
  }

  public var subscriber: Bgs_Protocol_Account_V1_Identity {
    get {return _storage._subscriber ?? Bgs_Protocol_Account_V1_Identity()}
    set {_uniqueStorage()._subscriber = newValue}
  }
  /// Returns true if `subscriber` has been explicitly set.
  public var hasSubscriber: Bool {return _storage._subscriber != nil}
  /// Clears the value of `subscriber`. Subsequent reads from it will return its default value.
  public mutating func clearSubscriber() {_storage._subscriber = nil}

  public var deliveryRequired: Bool {
    get {return _storage._deliveryRequired ?? false}
    set {_uniqueStorage()._deliveryRequired = newValue}
  }
  /// Returns true if `deliveryRequired` has been explicitly set.
  public var hasDeliveryRequired: Bool {return _storage._deliveryRequired != nil}
  /// Clears the value of `deliveryRequired`. Subsequent reads from it will return its default value.
  public mutating func clearDeliveryRequired() {_storage._deliveryRequired = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if !SwiftProtobuf.Internal.areAllInitialized(_storage._target) {return false}
      if let v = _storage._subscriber, !v.isInitialized {return false}
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
        case 1: try decoder.decodeRepeatedMessageField(value: &_storage._target)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._subscriber)
        case 3: try decoder.decodeSingularBoolField(value: &_storage._deliveryRequired)
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
      if !_storage._target.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._target, fieldNumber: 1)
      }
      if let v = _storage._subscriber {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._deliveryRequired {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_Notification_V1_Notification: SwiftProtobuf.Message {
  public static let protoMessageName: String = _protobuf_package + ".Notification"

  public var senderID: Bgs_Protocol_EntityId {
    get {return _storage._senderID ?? Bgs_Protocol_EntityId()}
    set {_uniqueStorage()._senderID = newValue}
  }
  /// Returns true if `senderID` has been explicitly set.
  public var hasSenderID: Bool {return _storage._senderID != nil}
  /// Clears the value of `senderID`. Subsequent reads from it will return its default value.
  public mutating func clearSenderID() {_storage._senderID = nil}

  public var targetID: Bgs_Protocol_EntityId {
    get {return _storage._targetID ?? Bgs_Protocol_EntityId()}
    set {_uniqueStorage()._targetID = newValue}
  }
  /// Returns true if `targetID` has been explicitly set.
  public var hasTargetID: Bool {return _storage._targetID != nil}
  /// Clears the value of `targetID`. Subsequent reads from it will return its default value.
  public mutating func clearTargetID() {_storage._targetID = nil}

  public var type: String {
    get {return _storage._type ?? String()}
    set {_uniqueStorage()._type = newValue}
  }
  /// Returns true if `type` has been explicitly set.
  public var hasType: Bool {return _storage._type != nil}
  /// Clears the value of `type`. Subsequent reads from it will return its default value.
  public mutating func clearType() {_storage._type = nil}

  public var attribute: [Bgs_Protocol_Attribute] {
    get {return _storage._attribute}
    set {_uniqueStorage()._attribute = newValue}
  }

  public var senderAccountID: Bgs_Protocol_EntityId {
    get {return _storage._senderAccountID ?? Bgs_Protocol_EntityId()}
    set {_uniqueStorage()._senderAccountID = newValue}
  }
  /// Returns true if `senderAccountID` has been explicitly set.
  public var hasSenderAccountID: Bool {return _storage._senderAccountID != nil}
  /// Clears the value of `senderAccountID`. Subsequent reads from it will return its default value.
  public mutating func clearSenderAccountID() {_storage._senderAccountID = nil}

  public var targetAccountID: Bgs_Protocol_EntityId {
    get {return _storage._targetAccountID ?? Bgs_Protocol_EntityId()}
    set {_uniqueStorage()._targetAccountID = newValue}
  }
  /// Returns true if `targetAccountID` has been explicitly set.
  public var hasTargetAccountID: Bool {return _storage._targetAccountID != nil}
  /// Clears the value of `targetAccountID`. Subsequent reads from it will return its default value.
  public mutating func clearTargetAccountID() {_storage._targetAccountID = nil}

  public var senderBattleTag: String {
    get {return _storage._senderBattleTag ?? String()}
    set {_uniqueStorage()._senderBattleTag = newValue}
  }
  /// Returns true if `senderBattleTag` has been explicitly set.
  public var hasSenderBattleTag: Bool {return _storage._senderBattleTag != nil}
  /// Clears the value of `senderBattleTag`. Subsequent reads from it will return its default value.
  public mutating func clearSenderBattleTag() {_storage._senderBattleTag = nil}

  public var targetBattleTag: String {
    get {return _storage._targetBattleTag ?? String()}
    set {_uniqueStorage()._targetBattleTag = newValue}
  }
  /// Returns true if `targetBattleTag` has been explicitly set.
  public var hasTargetBattleTag: Bool {return _storage._targetBattleTag != nil}
  /// Clears the value of `targetBattleTag`. Subsequent reads from it will return its default value.
  public mutating func clearTargetBattleTag() {_storage._targetBattleTag = nil}

  public var peer: Bgs_Protocol_ProcessId {
    get {return _storage._peer ?? Bgs_Protocol_ProcessId()}
    set {_uniqueStorage()._peer = newValue}
  }
  /// Returns true if `peer` has been explicitly set.
  public var hasPeer: Bool {return _storage._peer != nil}
  /// Clears the value of `peer`. Subsequent reads from it will return its default value.
  public mutating func clearPeer() {_storage._peer = nil}

  public var forwardingIdentity: Bgs_Protocol_Account_V1_Identity {
    get {return _storage._forwardingIdentity ?? Bgs_Protocol_Account_V1_Identity()}
    set {_uniqueStorage()._forwardingIdentity = newValue}
  }
  /// Returns true if `forwardingIdentity` has been explicitly set.
  public var hasForwardingIdentity: Bool {return _storage._forwardingIdentity != nil}
  /// Clears the value of `forwardingIdentity`. Subsequent reads from it will return its default value.
  public mutating func clearForwardingIdentity() {_storage._forwardingIdentity = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._targetID == nil {return false}
      if _storage._type == nil {return false}
      if let v = _storage._senderID, !v.isInitialized {return false}
      if let v = _storage._targetID, !v.isInitialized {return false}
      if !SwiftProtobuf.Internal.areAllInitialized(_storage._attribute) {return false}
      if let v = _storage._senderAccountID, !v.isInitialized {return false}
      if let v = _storage._targetAccountID, !v.isInitialized {return false}
      if let v = _storage._peer, !v.isInitialized {return false}
      if let v = _storage._forwardingIdentity, !v.isInitialized {return false}
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._senderID)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._targetID)
        case 3: try decoder.decodeSingularStringField(value: &_storage._type)
        case 4: try decoder.decodeRepeatedMessageField(value: &_storage._attribute)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._senderAccountID)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._targetAccountID)
        case 7: try decoder.decodeSingularStringField(value: &_storage._senderBattleTag)
        case 8: try decoder.decodeSingularStringField(value: &_storage._targetBattleTag)
        case 9: try decoder.decodeSingularMessageField(value: &_storage._peer)
        case 10: try decoder.decodeSingularMessageField(value: &_storage._forwardingIdentity)
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
      if let v = _storage._senderID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._targetID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._type {
        try visitor.visitSingularStringField(value: v, fieldNumber: 3)
      }
      if !_storage._attribute.isEmpty {
        try visitor.visitRepeatedMessageField(value: _storage._attribute, fieldNumber: 4)
      }
      if let v = _storage._senderAccountID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._targetAccountID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if let v = _storage._senderBattleTag {
        try visitor.visitSingularStringField(value: v, fieldNumber: 7)
      }
      if let v = _storage._targetBattleTag {
        try visitor.visitSingularStringField(value: v, fieldNumber: 8)
      }
      if let v = _storage._peer {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      }
      if let v = _storage._forwardingIdentity {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol.notification.v1"

extension Bgs_Protocol_Notification_V1_Target: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "identity"),
    2: .same(proto: "type"),
  ]

  fileprivate class _StorageClass {
    var _identity: Bgs_Protocol_Account_V1_Identity? = nil
    var _type: String? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _identity = source._identity
      _type = source._type
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_Notification_V1_Target) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._identity != other_storage._identity {return false}
        if _storage._type != other_storage._type {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Notification_V1_Subscription: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "target"),
    2: .same(proto: "subscriber"),
    3: .standard(proto: "delivery_required"),
  ]

  fileprivate class _StorageClass {
    var _target: [Bgs_Protocol_Notification_V1_Target] = []
    var _subscriber: Bgs_Protocol_Account_V1_Identity? = nil
    var _deliveryRequired: Bool? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _target = source._target
      _subscriber = source._subscriber
      _deliveryRequired = source._deliveryRequired
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_Notification_V1_Subscription) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._target != other_storage._target {return false}
        if _storage._subscriber != other_storage._subscriber {return false}
        if _storage._deliveryRequired != other_storage._deliveryRequired {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Notification_V1_Notification: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "sender_id"),
    2: .standard(proto: "target_id"),
    3: .same(proto: "type"),
    4: .same(proto: "attribute"),
    5: .standard(proto: "sender_account_id"),
    6: .standard(proto: "target_account_id"),
    7: .standard(proto: "sender_battle_tag"),
    8: .standard(proto: "target_battle_tag"),
    9: .same(proto: "peer"),
    10: .standard(proto: "forwarding_identity"),
  ]

  fileprivate class _StorageClass {
    var _senderID: Bgs_Protocol_EntityId? = nil
    var _targetID: Bgs_Protocol_EntityId? = nil
    var _type: String? = nil
    var _attribute: [Bgs_Protocol_Attribute] = []
    var _senderAccountID: Bgs_Protocol_EntityId? = nil
    var _targetAccountID: Bgs_Protocol_EntityId? = nil
    var _senderBattleTag: String? = nil
    var _targetBattleTag: String? = nil
    var _peer: Bgs_Protocol_ProcessId? = nil
    var _forwardingIdentity: Bgs_Protocol_Account_V1_Identity? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _senderID = source._senderID
      _targetID = source._targetID
      _type = source._type
      _attribute = source._attribute
      _senderAccountID = source._senderAccountID
      _targetAccountID = source._targetAccountID
      _senderBattleTag = source._senderBattleTag
      _targetBattleTag = source._targetBattleTag
      _peer = source._peer
      _forwardingIdentity = source._forwardingIdentity
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: Bgs_Protocol_Notification_V1_Notification) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._senderID != other_storage._senderID {return false}
        if _storage._targetID != other_storage._targetID {return false}
        if _storage._type != other_storage._type {return false}
        if _storage._attribute != other_storage._attribute {return false}
        if _storage._senderAccountID != other_storage._senderAccountID {return false}
        if _storage._targetAccountID != other_storage._targetAccountID {return false}
        if _storage._senderBattleTag != other_storage._senderBattleTag {return false}
        if _storage._targetBattleTag != other_storage._targetBattleTag {return false}
        if _storage._peer != other_storage._peer {return false}
        if _storage._forwardingIdentity != other_storage._forwardingIdentity {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
