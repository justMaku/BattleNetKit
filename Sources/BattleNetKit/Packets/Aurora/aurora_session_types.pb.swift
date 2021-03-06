// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/session_types.proto
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

public struct Bgs_Protocol_Session_V1_SessionOptions {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var billing: Bool {
    get {return _billing ?? true}
    set {_billing = newValue}
  }
  /// Returns true if `billing` has been explicitly set.
  public var hasBilling: Bool {return self._billing != nil}
  /// Clears the value of `billing`. Subsequent reads from it will return its default value.
  public mutating func clearBilling() {self._billing = nil}

  public var presence: Bool {
    get {return _presence ?? true}
    set {_presence = newValue}
  }
  /// Returns true if `presence` has been explicitly set.
  public var hasPresence: Bool {return self._presence != nil}
  /// Clears the value of `presence`. Subsequent reads from it will return its default value.
  public mutating func clearPresence() {self._presence = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _billing: Bool? = nil
  fileprivate var _presence: Bool? = nil
}

public struct Bgs_Protocol_Session_V1_SessionState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var handle: Bgs_Protocol_Account_V1_GameAccountHandle {
    get {return _storage._handle ?? Bgs_Protocol_Account_V1_GameAccountHandle()}
    set {_uniqueStorage()._handle = newValue}
  }
  /// Returns true if `handle` has been explicitly set.
  public var hasHandle: Bool {return _storage._handle != nil}
  /// Clears the value of `handle`. Subsequent reads from it will return its default value.
  public mutating func clearHandle() {_uniqueStorage()._handle = nil}

  public var clientAddress: String {
    get {return _storage._clientAddress ?? String()}
    set {_uniqueStorage()._clientAddress = newValue}
  }
  /// Returns true if `clientAddress` has been explicitly set.
  public var hasClientAddress: Bool {return _storage._clientAddress != nil}
  /// Clears the value of `clientAddress`. Subsequent reads from it will return its default value.
  public mutating func clearClientAddress() {_uniqueStorage()._clientAddress = nil}

  public var lastTickTime: UInt64 {
    get {return _storage._lastTickTime ?? 0}
    set {_uniqueStorage()._lastTickTime = newValue}
  }
  /// Returns true if `lastTickTime` has been explicitly set.
  public var hasLastTickTime: Bool {return _storage._lastTickTime != nil}
  /// Clears the value of `lastTickTime`. Subsequent reads from it will return its default value.
  public mutating func clearLastTickTime() {_uniqueStorage()._lastTickTime = nil}

  public var createTime: UInt64 {
    get {return _storage._createTime ?? 0}
    set {_uniqueStorage()._createTime = newValue}
  }
  /// Returns true if `createTime` has been explicitly set.
  public var hasCreateTime: Bool {return _storage._createTime != nil}
  /// Clears the value of `createTime`. Subsequent reads from it will return its default value.
  public mutating func clearCreateTime() {_uniqueStorage()._createTime = nil}

  public var parentalControlsActive: Bool {
    get {return _storage._parentalControlsActive ?? false}
    set {_uniqueStorage()._parentalControlsActive = newValue}
  }
  /// Returns true if `parentalControlsActive` has been explicitly set.
  public var hasParentalControlsActive: Bool {return _storage._parentalControlsActive != nil}
  /// Clears the value of `parentalControlsActive`. Subsequent reads from it will return its default value.
  public mutating func clearParentalControlsActive() {_uniqueStorage()._parentalControlsActive = nil}

  public var location: Bgs_Protocol_Account_V1_GameSessionLocation {
    get {return _storage._location ?? Bgs_Protocol_Account_V1_GameSessionLocation()}
    set {_uniqueStorage()._location = newValue}
  }
  /// Returns true if `location` has been explicitly set.
  public var hasLocation: Bool {return _storage._location != nil}
  /// Clears the value of `location`. Subsequent reads from it will return its default value.
  public mutating func clearLocation() {_uniqueStorage()._location = nil}

  public var usingIgrAddress: Bool {
    get {return _storage._usingIgrAddress ?? false}
    set {_uniqueStorage()._usingIgrAddress = newValue}
  }
  /// Returns true if `usingIgrAddress` has been explicitly set.
  public var hasUsingIgrAddress: Bool {return _storage._usingIgrAddress != nil}
  /// Clears the value of `usingIgrAddress`. Subsequent reads from it will return its default value.
  public mutating func clearUsingIgrAddress() {_uniqueStorage()._usingIgrAddress = nil}

  public var hasBenefactor_p: Bool {
    get {return _storage._hasBenefactor_p ?? false}
    set {_uniqueStorage()._hasBenefactor_p = newValue}
  }
  /// Returns true if `hasBenefactor_p` has been explicitly set.
  public var hasHasBenefactor_p: Bool {return _storage._hasBenefactor_p != nil}
  /// Clears the value of `hasBenefactor_p`. Subsequent reads from it will return its default value.
  public mutating func clearHasBenefactor_p() {_uniqueStorage()._hasBenefactor_p = nil}

  public var igrID: Bgs_Protocol_Account_V1_IgrId {
    get {return _storage._igrID ?? Bgs_Protocol_Account_V1_IgrId()}
    set {_uniqueStorage()._igrID = newValue}
  }
  /// Returns true if `igrID` has been explicitly set.
  public var hasIgrID: Bool {return _storage._igrID != nil}
  /// Clears the value of `igrID`. Subsequent reads from it will return its default value.
  public mutating func clearIgrID() {_uniqueStorage()._igrID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_Session_V1_SessionIdentifier {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var gameAccount: Bgs_Protocol_Account_V1_GameAccountHandle {
    get {return _storage._gameAccount ?? Bgs_Protocol_Account_V1_GameAccountHandle()}
    set {_uniqueStorage()._gameAccount = newValue}
  }
  /// Returns true if `gameAccount` has been explicitly set.
  public var hasGameAccount: Bool {return _storage._gameAccount != nil}
  /// Clears the value of `gameAccount`. Subsequent reads from it will return its default value.
  public mutating func clearGameAccount() {_uniqueStorage()._gameAccount = nil}

  public var sessionID: String {
    get {return _storage._sessionID ?? String()}
    set {_uniqueStorage()._sessionID = newValue}
  }
  /// Returns true if `sessionID` has been explicitly set.
  public var hasSessionID: Bool {return _storage._sessionID != nil}
  /// Clears the value of `sessionID`. Subsequent reads from it will return its default value.
  public mutating func clearSessionID() {_uniqueStorage()._sessionID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol.session.v1"

extension Bgs_Protocol_Session_V1_SessionOptions: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SessionOptions"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "billing"),
    2: .same(proto: "presence"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBoolField(value: &self._billing)
      case 2: try decoder.decodeSingularBoolField(value: &self._presence)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._billing {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 1)
    }
    if let v = self._presence {
      try visitor.visitSingularBoolField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Session_V1_SessionOptions, rhs: Bgs_Protocol_Session_V1_SessionOptions) -> Bool {
    if lhs._billing != rhs._billing {return false}
    if lhs._presence != rhs._presence {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Session_V1_SessionState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SessionState"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "handle"),
    2: .standard(proto: "client_address"),
    3: .standard(proto: "last_tick_time"),
    4: .standard(proto: "create_time"),
    5: .standard(proto: "parental_controls_active"),
    6: .same(proto: "location"),
    7: .standard(proto: "using_igr_address"),
    8: .standard(proto: "has_benefactor"),
    9: .standard(proto: "igr_id"),
  ]

  fileprivate class _StorageClass {
    var _handle: Bgs_Protocol_Account_V1_GameAccountHandle? = nil
    var _clientAddress: String? = nil
    var _lastTickTime: UInt64? = nil
    var _createTime: UInt64? = nil
    var _parentalControlsActive: Bool? = nil
    var _location: Bgs_Protocol_Account_V1_GameSessionLocation? = nil
    var _usingIgrAddress: Bool? = nil
    var _hasBenefactor_p: Bool? = nil
    var _igrID: Bgs_Protocol_Account_V1_IgrId? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _handle = source._handle
      _clientAddress = source._clientAddress
      _lastTickTime = source._lastTickTime
      _createTime = source._createTime
      _parentalControlsActive = source._parentalControlsActive
      _location = source._location
      _usingIgrAddress = source._usingIgrAddress
      _hasBenefactor_p = source._hasBenefactor_p
      _igrID = source._igrID
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._handle, !v.isInitialized {return false}
      if let v = _storage._igrID, !v.isInitialized {return false}
      return true
    }
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._handle)
        case 2: try decoder.decodeSingularStringField(value: &_storage._clientAddress)
        case 3: try decoder.decodeSingularUInt64Field(value: &_storage._lastTickTime)
        case 4: try decoder.decodeSingularUInt64Field(value: &_storage._createTime)
        case 5: try decoder.decodeSingularBoolField(value: &_storage._parentalControlsActive)
        case 6: try decoder.decodeSingularMessageField(value: &_storage._location)
        case 7: try decoder.decodeSingularBoolField(value: &_storage._usingIgrAddress)
        case 8: try decoder.decodeSingularBoolField(value: &_storage._hasBenefactor_p)
        case 9: try decoder.decodeSingularMessageField(value: &_storage._igrID)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._handle {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._clientAddress {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
      if let v = _storage._lastTickTime {
        try visitor.visitSingularUInt64Field(value: v, fieldNumber: 3)
      }
      if let v = _storage._createTime {
        try visitor.visitSingularUInt64Field(value: v, fieldNumber: 4)
      }
      if let v = _storage._parentalControlsActive {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 5)
      }
      if let v = _storage._location {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
      }
      if let v = _storage._usingIgrAddress {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 7)
      }
      if let v = _storage._hasBenefactor_p {
        try visitor.visitSingularBoolField(value: v, fieldNumber: 8)
      }
      if let v = _storage._igrID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Session_V1_SessionState, rhs: Bgs_Protocol_Session_V1_SessionState) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._handle != rhs_storage._handle {return false}
        if _storage._clientAddress != rhs_storage._clientAddress {return false}
        if _storage._lastTickTime != rhs_storage._lastTickTime {return false}
        if _storage._createTime != rhs_storage._createTime {return false}
        if _storage._parentalControlsActive != rhs_storage._parentalControlsActive {return false}
        if _storage._location != rhs_storage._location {return false}
        if _storage._usingIgrAddress != rhs_storage._usingIgrAddress {return false}
        if _storage._hasBenefactor_p != rhs_storage._hasBenefactor_p {return false}
        if _storage._igrID != rhs_storage._igrID {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Session_V1_SessionIdentifier: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".SessionIdentifier"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "game_account"),
    2: .standard(proto: "session_id"),
  ]

  fileprivate class _StorageClass {
    var _gameAccount: Bgs_Protocol_Account_V1_GameAccountHandle? = nil
    var _sessionID: String? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _gameAccount = source._gameAccount
      _sessionID = source._sessionID
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._gameAccount, !v.isInitialized {return false}
      return true
    }
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._gameAccount)
        case 2: try decoder.decodeSingularStringField(value: &_storage._sessionID)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._gameAccount {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._sessionID {
        try visitor.visitSingularStringField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Session_V1_SessionIdentifier, rhs: Bgs_Protocol_Session_V1_SessionIdentifier) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._gameAccount != rhs_storage._gameAccount {return false}
        if _storage._sessionID != rhs_storage._sessionID {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
