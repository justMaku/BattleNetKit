// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: aurora/channel_voice_service.proto
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

public struct Bgs_Protocol_Channel_V1_GetLoginTokenRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var memberID: Bgs_Protocol_Account_V1_GameAccountHandle {
    get {return _storage._memberID ?? Bgs_Protocol_Account_V1_GameAccountHandle()}
    set {_uniqueStorage()._memberID = newValue}
  }
  /// Returns true if `memberID` has been explicitly set.
  public var hasMemberID: Bool {return _storage._memberID != nil}
  /// Clears the value of `memberID`. Subsequent reads from it will return its default value.
  public mutating func clearMemberID() {_uniqueStorage()._memberID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_Channel_V1_GetLoginTokenResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var credentials: Bgs_Protocol_VoiceCredentials {
    get {return _storage._credentials ?? Bgs_Protocol_VoiceCredentials()}
    set {_uniqueStorage()._credentials = newValue}
  }
  /// Returns true if `credentials` has been explicitly set.
  public var hasCredentials: Bool {return _storage._credentials != nil}
  /// Clears the value of `credentials`. Subsequent reads from it will return its default value.
  public mutating func clearCredentials() {_uniqueStorage()._credentials = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_Channel_V1_GetJoinTokenRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var channelID: Bgs_Protocol_Channel_V1_ChannelId {
    get {return _storage._channelID ?? Bgs_Protocol_Channel_V1_ChannelId()}
    set {_uniqueStorage()._channelID = newValue}
  }
  /// Returns true if `channelID` has been explicitly set.
  public var hasChannelID: Bool {return _storage._channelID != nil}
  /// Clears the value of `channelID`. Subsequent reads from it will return its default value.
  public mutating func clearChannelID() {_uniqueStorage()._channelID = nil}

  public var memberID: Bgs_Protocol_Account_V1_GameAccountHandle {
    get {return _storage._memberID ?? Bgs_Protocol_Account_V1_GameAccountHandle()}
    set {_uniqueStorage()._memberID = newValue}
  }
  /// Returns true if `memberID` has been explicitly set.
  public var hasMemberID: Bool {return _storage._memberID != nil}
  /// Clears the value of `memberID`. Subsequent reads from it will return its default value.
  public mutating func clearMemberID() {_uniqueStorage()._memberID = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct Bgs_Protocol_Channel_V1_GetJoinTokenResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var channelUri: String {
    get {return _storage._channelUri ?? String()}
    set {_uniqueStorage()._channelUri = newValue}
  }
  /// Returns true if `channelUri` has been explicitly set.
  public var hasChannelUri: Bool {return _storage._channelUri != nil}
  /// Clears the value of `channelUri`. Subsequent reads from it will return its default value.
  public mutating func clearChannelUri() {_uniqueStorage()._channelUri = nil}

  public var credentials: Bgs_Protocol_VoiceCredentials {
    get {return _storage._credentials ?? Bgs_Protocol_VoiceCredentials()}
    set {_uniqueStorage()._credentials = newValue}
  }
  /// Returns true if `credentials` has been explicitly set.
  public var hasCredentials: Bool {return _storage._credentials != nil}
  /// Clears the value of `credentials`. Subsequent reads from it will return its default value.
  public mutating func clearCredentials() {_uniqueStorage()._credentials = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bgs.protocol.channel.v1"

extension Bgs_Protocol_Channel_V1_GetLoginTokenRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetLoginTokenRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    3: .standard(proto: "member_id"),
  ]

  fileprivate class _StorageClass {
    var _memberID: Bgs_Protocol_Account_V1_GameAccountHandle? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _memberID = source._memberID
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
      if let v = _storage._memberID, !v.isInitialized {return false}
      return true
    }
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 3: try decoder.decodeSingularMessageField(value: &_storage._memberID)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._memberID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Channel_V1_GetLoginTokenRequest, rhs: Bgs_Protocol_Channel_V1_GetLoginTokenRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._memberID != rhs_storage._memberID {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Channel_V1_GetLoginTokenResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetLoginTokenResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "credentials"),
  ]

  fileprivate class _StorageClass {
    var _credentials: Bgs_Protocol_VoiceCredentials? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _credentials = source._credentials
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._credentials)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._credentials {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Channel_V1_GetLoginTokenResponse, rhs: Bgs_Protocol_Channel_V1_GetLoginTokenResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._credentials != rhs_storage._credentials {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Channel_V1_GetJoinTokenRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetJoinTokenRequest"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .standard(proto: "channel_id"),
    4: .standard(proto: "member_id"),
  ]

  fileprivate class _StorageClass {
    var _channelID: Bgs_Protocol_Channel_V1_ChannelId? = nil
    var _memberID: Bgs_Protocol_Account_V1_GameAccountHandle? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _channelID = source._channelID
      _memberID = source._memberID
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
      if let v = _storage._channelID, !v.isInitialized {return false}
      if let v = _storage._memberID, !v.isInitialized {return false}
      return true
    }
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 2: try decoder.decodeSingularMessageField(value: &_storage._channelID)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._memberID)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._channelID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._memberID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Channel_V1_GetJoinTokenRequest, rhs: Bgs_Protocol_Channel_V1_GetJoinTokenRequest) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._channelID != rhs_storage._channelID {return false}
        if _storage._memberID != rhs_storage._memberID {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bgs_Protocol_Channel_V1_GetJoinTokenResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".GetJoinTokenResponse"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_uri"),
    2: .same(proto: "credentials"),
  ]

  fileprivate class _StorageClass {
    var _channelUri: String? = nil
    var _credentials: Bgs_Protocol_VoiceCredentials? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _channelUri = source._channelUri
      _credentials = source._credentials
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularStringField(value: &_storage._channelUri)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._credentials)
        default: break
        }
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._channelUri {
        try visitor.visitSingularStringField(value: v, fieldNumber: 1)
      }
      if let v = _storage._credentials {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Bgs_Protocol_Channel_V1_GetJoinTokenResponse, rhs: Bgs_Protocol_Channel_V1_GetJoinTokenResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._channelUri != rhs_storage._channelUri {return false}
        if _storage._credentials != rhs_storage._credentials {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
