// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ConnectResponse.proto
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

public struct ConnectResponse: SwiftProtobuf.Message {
  public static let protoMessageName: String = "ConnectResponse"

  public var serverID: ProcessId {
    get {return _storage._serverID ?? ProcessId()}
    set {_uniqueStorage()._serverID = newValue}
  }
  /// Returns true if `serverID` has been explicitly set.
  public var hasServerID: Bool {return _storage._serverID != nil}
  /// Clears the value of `serverID`. Subsequent reads from it will return its default value.
  public mutating func clearServerID() {_storage._serverID = nil}

  public var clientID: ProcessId {
    get {return _storage._clientID ?? ProcessId()}
    set {_uniqueStorage()._clientID = newValue}
  }
  /// Returns true if `clientID` has been explicitly set.
  public var hasClientID: Bool {return _storage._clientID != nil}
  /// Clears the value of `clientID`. Subsequent reads from it will return its default value.
  public mutating func clearClientID() {_storage._clientID = nil}

  public var bindResult: UInt32 {
    get {return _storage._bindResult ?? 0}
    set {_uniqueStorage()._bindResult = newValue}
  }
  /// Returns true if `bindResult` has been explicitly set.
  public var hasBindResult: Bool {return _storage._bindResult != nil}
  /// Clears the value of `bindResult`. Subsequent reads from it will return its default value.
  public mutating func clearBindResult() {_storage._bindResult = nil}

  public var bindResponse: BindResponse {
    get {return _storage._bindResponse ?? BindResponse()}
    set {_uniqueStorage()._bindResponse = newValue}
  }
  /// Returns true if `bindResponse` has been explicitly set.
  public var hasBindResponse: Bool {return _storage._bindResponse != nil}
  /// Clears the value of `bindResponse`. Subsequent reads from it will return its default value.
  public mutating func clearBindResponse() {_storage._bindResponse = nil}

  public var contentHandleArray: ConnectionMeteringContentHandles {
    get {return _storage._contentHandleArray ?? ConnectionMeteringContentHandles()}
    set {_uniqueStorage()._contentHandleArray = newValue}
  }
  /// Returns true if `contentHandleArray` has been explicitly set.
  public var hasContentHandleArray: Bool {return _storage._contentHandleArray != nil}
  /// Clears the value of `contentHandleArray`. Subsequent reads from it will return its default value.
  public mutating func clearContentHandleArray() {_storage._contentHandleArray = nil}

  public var serverTime: UInt64 {
    get {return _storage._serverTime ?? 0}
    set {_uniqueStorage()._serverTime = newValue}
  }
  /// Returns true if `serverTime` has been explicitly set.
  public var hasServerTime: Bool {return _storage._serverTime != nil}
  /// Clears the value of `serverTime`. Subsequent reads from it will return its default value.
  public mutating func clearServerTime() {_storage._serverTime = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if _storage._serverID == nil {return false}
      if let v = _storage._serverID, !v.isInitialized {return false}
      if let v = _storage._clientID, !v.isInitialized {return false}
      if let v = _storage._contentHandleArray, !v.isInitialized {return false}
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._serverID)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._clientID)
        case 3: try decoder.decodeSingularUInt32Field(value: &_storage._bindResult)
        case 4: try decoder.decodeSingularMessageField(value: &_storage._bindResponse)
        case 5: try decoder.decodeSingularMessageField(value: &_storage._contentHandleArray)
        case 6: try decoder.decodeSingularUInt64Field(value: &_storage._serverTime)
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
      if let v = _storage._serverID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._clientID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._bindResult {
        try visitor.visitSingularUInt32Field(value: v, fieldNumber: 3)
      }
      if let v = _storage._bindResponse {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
      if let v = _storage._contentHandleArray {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
      }
      if let v = _storage._serverTime {
        try visitor.visitSingularUInt64Field(value: v, fieldNumber: 6)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

public struct ConnectionMeteringContentHandles: SwiftProtobuf.Message {
  public static let protoMessageName: String = "ConnectionMeteringContentHandles"

  public var contentHandle: [ContentHandle] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    if !SwiftProtobuf.Internal.areAllInitialized(self.contentHandle) {return false}
    return true
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.contentHandle)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.contentHandle.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.contentHandle, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

public struct ContentHandle: SwiftProtobuf.Message {
  public static let protoMessageName: String = "ContentHandle"

  public var region: UInt32 {
    get {return _region ?? 0}
    set {_region = newValue}
  }
  /// Returns true if `region` has been explicitly set.
  public var hasRegion: Bool {return self._region != nil}
  /// Clears the value of `region`. Subsequent reads from it will return its default value.
  public mutating func clearRegion() {self._region = nil}

  public var usage: UInt32 {
    get {return _usage ?? 0}
    set {_usage = newValue}
  }
  /// Returns true if `usage` has been explicitly set.
  public var hasUsage: Bool {return self._usage != nil}
  /// Clears the value of `usage`. Subsequent reads from it will return its default value.
  public mutating func clearUsage() {self._usage = nil}

  public var hash: Data {
    get {return _hash ?? SwiftProtobuf.Internal.emptyData}
    set {_hash = newValue}
  }
  /// Returns true if `hash` has been explicitly set.
  public var hasHash: Bool {return self._hash != nil}
  /// Clears the value of `hash`. Subsequent reads from it will return its default value.
  public mutating func clearHash() {self._hash = nil}

  public var protoURL: String {
    get {return _protoURL ?? String()}
    set {_protoURL = newValue}
  }
  /// Returns true if `protoURL` has been explicitly set.
  public var hasProtoURL: Bool {return self._protoURL != nil}
  /// Clears the value of `protoURL`. Subsequent reads from it will return its default value.
  public mutating func clearProtoURL() {self._protoURL = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    if self._region == nil {return false}
    if self._usage == nil {return false}
    if self._hash == nil {return false}
    return true
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularFixed32Field(value: &self._region)
      case 2: try decoder.decodeSingularFixed32Field(value: &self._usage)
      case 3: try decoder.decodeSingularBytesField(value: &self._hash)
      case 4: try decoder.decodeSingularStringField(value: &self._protoURL)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._region {
      try visitor.visitSingularFixed32Field(value: v, fieldNumber: 1)
    }
    if let v = self._usage {
      try visitor.visitSingularFixed32Field(value: v, fieldNumber: 2)
    }
    if let v = self._hash {
      try visitor.visitSingularBytesField(value: v, fieldNumber: 3)
    }
    if let v = self._protoURL {
      try visitor.visitSingularStringField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _region: UInt32? = nil
  fileprivate var _usage: UInt32? = nil
  fileprivate var _hash: Data? = nil
  fileprivate var _protoURL: String? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ConnectResponse: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "server_id"),
    2: .standard(proto: "client_id"),
    3: .standard(proto: "bind_result"),
    4: .standard(proto: "bind_response"),
    5: .standard(proto: "content_handle_array"),
    6: .standard(proto: "server_time"),
  ]

  fileprivate class _StorageClass {
    var _serverID: ProcessId? = nil
    var _clientID: ProcessId? = nil
    var _bindResult: UInt32? = nil
    var _bindResponse: BindResponse? = nil
    var _contentHandleArray: ConnectionMeteringContentHandles? = nil
    var _serverTime: UInt64? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _serverID = source._serverID
      _clientID = source._clientID
      _bindResult = source._bindResult
      _bindResponse = source._bindResponse
      _contentHandleArray = source._contentHandleArray
      _serverTime = source._serverTime
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: ConnectResponse) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._serverID != other_storage._serverID {return false}
        if _storage._clientID != other_storage._clientID {return false}
        if _storage._bindResult != other_storage._bindResult {return false}
        if _storage._bindResponse != other_storage._bindResponse {return false}
        if _storage._contentHandleArray != other_storage._contentHandleArray {return false}
        if _storage._serverTime != other_storage._serverTime {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ConnectionMeteringContentHandles: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "content_handle"),
  ]

  public func _protobuf_generated_isEqualTo(other: ConnectionMeteringContentHandles) -> Bool {
    if self.contentHandle != other.contentHandle {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}

extension ContentHandle: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "region"),
    2: .same(proto: "usage"),
    3: .same(proto: "hash"),
    4: .standard(proto: "proto_url"),
  ]

  public func _protobuf_generated_isEqualTo(other: ContentHandle) -> Bool {
    if self._region != other._region {return false}
    if self._usage != other._usage {return false}
    if self._hash != other._hash {return false}
    if self._protoURL != other._protoURL {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
