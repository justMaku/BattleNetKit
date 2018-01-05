// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ConnectRequest.proto
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

public struct ConnectRequest: SwiftProtobuf.Message {
  public static let protoMessageName: String = "ConnectRequest"

  public var clientID: ProcessId {
    get {return _storage._clientID ?? ProcessId()}
    set {_uniqueStorage()._clientID = newValue}
  }
  /// Returns true if `clientID` has been explicitly set.
  public var hasClientID: Bool {return _storage._clientID != nil}
  /// Clears the value of `clientID`. Subsequent reads from it will return its default value.
  public mutating func clearClientID() {_storage._clientID = nil}

  public var bindRequest: BindRequest {
    get {return _storage._bindRequest ?? BindRequest()}
    set {_uniqueStorage()._bindRequest = newValue}
  }
  /// Returns true if `bindRequest` has been explicitly set.
  public var hasBindRequest: Bool {return _storage._bindRequest != nil}
  /// Clears the value of `bindRequest`. Subsequent reads from it will return its default value.
  public mutating func clearBindRequest() {_storage._bindRequest = nil}

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    return withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._clientID, !v.isInitialized {return false}
      if let v = _storage._bindRequest, !v.isInitialized {return false}
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
        case 1: try decoder.decodeSingularMessageField(value: &_storage._clientID)
        case 2: try decoder.decodeSingularMessageField(value: &_storage._bindRequest)
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
      if let v = _storage._clientID {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._bindRequest {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension ConnectRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "client_id"),
    2: .standard(proto: "bind_request"),
  ]

  fileprivate class _StorageClass {
    var _clientID: ProcessId? = nil
    var _bindRequest: BindRequest? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _clientID = source._clientID
      _bindRequest = source._bindRequest
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  public func _protobuf_generated_isEqualTo(other: ConnectRequest) -> Bool {
    if _storage !== other._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((_storage, other._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let other_storage = _args.1
        if _storage._clientID != other_storage._clientID {return false}
        if _storage._bindRequest != other_storage._bindRequest {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
