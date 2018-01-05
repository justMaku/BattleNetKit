// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: BindRequest.proto
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

public struct BindRequest: SwiftProtobuf.Message {
  public static let protoMessageName: String = "BindRequest"

  public var importedServicesHash: [UInt32] = []

  public var exportedServices: [BoundService] = []

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}

  public var isInitialized: Bool {
    if !SwiftProtobuf.Internal.areAllInitialized(self.exportedServices) {return false}
    return true
  }

  /// Used by the decoding initializers in the SwiftProtobuf library, not generally
  /// used directly. `init(serializedData:)`, `init(jsonUTF8Data:)`, and other decoding
  /// initializers are defined in the SwiftProtobuf library. See the Message and
  /// Message+*Additions` files.
  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedFixed32Field(value: &self.importedServicesHash)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.exportedServices)
      default: break
      }
    }
  }

  /// Used by the encoding methods of the SwiftProtobuf library, not generally
  /// used directly. `Message.serializedData()`, `Message.jsonUTF8Data()`, and
  /// other serializer methods are defined in the SwiftProtobuf library. See the
  /// `Message` and `Message+*Additions` files.
  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.importedServicesHash.isEmpty {
      try visitor.visitRepeatedFixed32Field(value: self.importedServicesHash, fieldNumber: 1)
    }
    if !self.exportedServices.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.exportedServices, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension BindRequest: SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "imported_services_hash"),
    2: .standard(proto: "exported_services"),
  ]

  public func _protobuf_generated_isEqualTo(other: BindRequest) -> Bool {
    if self.importedServicesHash != other.importedServicesHash {return false}
    if self.exportedServices != other.exportedServices {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}