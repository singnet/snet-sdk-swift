// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: state_service.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// ChanelStateRequest is a request for channel state.
struct Escrow_ChannelStateRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// channel_id contains id of the channel which state is requested.
  var channelID: Data = Data()

  /// signature is a client signature of the message which contains
  /// channel_id. It is used for client authorization.
  var signature: Data = Data()

  ///current block number (signature will be valid only for short time around this block number)
  var currentBlock: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ChannelStateReply message contains a latest channel state. current_nonce and
/// current_value fields can be different from ones stored in the blockchain if
/// server started withdrawing funds froms channel but transaction is still not
/// finished.
struct Escrow_ChannelStateReply {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// current_nonce is a latest nonce of the payment channel.
  var currentNonce: Data = Data()

  /// current_signed_amount is a last amount which were signed by client with current_nonce
  ///it could be absent if none message was signed with current_nonce
  var currentSignedAmount: Data = Data()

  /// current_signature is a last signature sent by client with current_nonce
  /// it could be absent if none message was signed with current nonce
  var currentSignature: Data = Data()

  /// last amount which was signed by client with nonce=current_nonce - 1
  var oldNonceSignedAmount: Data = Data()

  /// last signature sent by client with nonce = current_nonce - 1
  var oldNonceSignature: Data = Data()

  ///If the client / user chooses to sign upfront , the planned amount in cogs will be indicative of this.
  ///For pay per use, this will be zero
  var plannedAmount: UInt64 = 0

  ///If the client / user chooses to sign upfront , the usage amount in cogs will be indicative of how much of the
  ///planned amount has actually been used.
  ///For pay per use, this will be zero
  var usedAmount: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Escrow_FreeCallStateRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///Has the user email id
  var userID: String = String()

  ///signer-token = (user@mail, user-public-key, token_issue_date), this is generated my Market place Dapp
  ///to leverage free calls from SDK/ snet-cli, you will need this signer-token to be downloaded from Dapp
  var tokenForFreeCall: Data = Data()

  ///Token expiration date in Block number
  var tokenExpiryDateBlock: UInt64 = 0

  ///Signature is made up of the below, user signs with the private key corresponding with the public key used to generate the authorized token
  ///free-call-metadata = ("__prefix_free_trial",user_id,organization_id,service_id,group_id,current_block,authorized_token)
  var signature: Data = Data()

  ///current block number (signature will be valid only for short time around this block number)
  var currentBlock: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Escrow_FreeCallStateReply {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  ///Has the user email id
  var userID: String = String()

  ///Balance number of free calls available
  var freeCallsAvailable: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "escrow"

extension Escrow_ChannelStateRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChannelStateRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_id"),
    2: .same(proto: "signature"),
    3: .standard(proto: "current_block"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.channelID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.signature) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.currentBlock) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.channelID.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelID, fieldNumber: 1)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularBytesField(value: self.signature, fieldNumber: 2)
    }
    if self.currentBlock != 0 {
      try visitor.visitSingularUInt64Field(value: self.currentBlock, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Escrow_ChannelStateRequest, rhs: Escrow_ChannelStateRequest) -> Bool {
    if lhs.channelID != rhs.channelID {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs.currentBlock != rhs.currentBlock {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Escrow_ChannelStateReply: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChannelStateReply"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "current_nonce"),
    2: .standard(proto: "current_signed_amount"),
    3: .standard(proto: "current_signature"),
    4: .standard(proto: "old_nonce_signed_amount"),
    5: .standard(proto: "old_nonce_signature"),
    6: .standard(proto: "planned_amount"),
    7: .standard(proto: "used_amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.currentNonce) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.currentSignedAmount) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.currentSignature) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.oldNonceSignedAmount) }()
      case 5: try { try decoder.decodeSingularBytesField(value: &self.oldNonceSignature) }()
      case 6: try { try decoder.decodeSingularUInt64Field(value: &self.plannedAmount) }()
      case 7: try { try decoder.decodeSingularUInt64Field(value: &self.usedAmount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.currentNonce.isEmpty {
      try visitor.visitSingularBytesField(value: self.currentNonce, fieldNumber: 1)
    }
    if !self.currentSignedAmount.isEmpty {
      try visitor.visitSingularBytesField(value: self.currentSignedAmount, fieldNumber: 2)
    }
    if !self.currentSignature.isEmpty {
      try visitor.visitSingularBytesField(value: self.currentSignature, fieldNumber: 3)
    }
    if !self.oldNonceSignedAmount.isEmpty {
      try visitor.visitSingularBytesField(value: self.oldNonceSignedAmount, fieldNumber: 4)
    }
    if !self.oldNonceSignature.isEmpty {
      try visitor.visitSingularBytesField(value: self.oldNonceSignature, fieldNumber: 5)
    }
    if self.plannedAmount != 0 {
      try visitor.visitSingularUInt64Field(value: self.plannedAmount, fieldNumber: 6)
    }
    if self.usedAmount != 0 {
      try visitor.visitSingularUInt64Field(value: self.usedAmount, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Escrow_ChannelStateReply, rhs: Escrow_ChannelStateReply) -> Bool {
    if lhs.currentNonce != rhs.currentNonce {return false}
    if lhs.currentSignedAmount != rhs.currentSignedAmount {return false}
    if lhs.currentSignature != rhs.currentSignature {return false}
    if lhs.oldNonceSignedAmount != rhs.oldNonceSignedAmount {return false}
    if lhs.oldNonceSignature != rhs.oldNonceSignature {return false}
    if lhs.plannedAmount != rhs.plannedAmount {return false}
    if lhs.usedAmount != rhs.usedAmount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Escrow_FreeCallStateRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FreeCallStateRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .standard(proto: "token_for_free_call"),
    3: .standard(proto: "token_expiry_date_block"),
    4: .same(proto: "signature"),
    5: .standard(proto: "current_block"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.tokenForFreeCall) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.tokenExpiryDateBlock) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.signature) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.currentBlock) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if !self.tokenForFreeCall.isEmpty {
      try visitor.visitSingularBytesField(value: self.tokenForFreeCall, fieldNumber: 2)
    }
    if self.tokenExpiryDateBlock != 0 {
      try visitor.visitSingularUInt64Field(value: self.tokenExpiryDateBlock, fieldNumber: 3)
    }
    if !self.signature.isEmpty {
      try visitor.visitSingularBytesField(value: self.signature, fieldNumber: 4)
    }
    if self.currentBlock != 0 {
      try visitor.visitSingularUInt64Field(value: self.currentBlock, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Escrow_FreeCallStateRequest, rhs: Escrow_FreeCallStateRequest) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.tokenForFreeCall != rhs.tokenForFreeCall {return false}
    if lhs.tokenExpiryDateBlock != rhs.tokenExpiryDateBlock {return false}
    if lhs.signature != rhs.signature {return false}
    if lhs.currentBlock != rhs.currentBlock {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Escrow_FreeCallStateReply: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FreeCallStateReply"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "user_id"),
    2: .standard(proto: "free_calls_available"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.userID) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.freeCallsAvailable) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.userID.isEmpty {
      try visitor.visitSingularStringField(value: self.userID, fieldNumber: 1)
    }
    if self.freeCallsAvailable != 0 {
      try visitor.visitSingularUInt64Field(value: self.freeCallsAvailable, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Escrow_FreeCallStateReply, rhs: Escrow_FreeCallStateReply) -> Bool {
    if lhs.userID != rhs.userID {return false}
    if lhs.freeCallsAvailable != rhs.freeCallsAvailable {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}