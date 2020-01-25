import Foundation
import NIO
import SwiftProtobuf

class Bnet_Protocol_Club_V1_ClubMembershipListener: ServiceType {
    enum Method: Int, MethodType {
        case OnClubAdded = 1
        case OnClubRemoved = 2
        case OnReceivedInvitationAdded = 3
        case OnReceivedInvitationRemoved = 4
        case OnSharedSettingsChanged = 5
        case OnStreamMentionAdded = 6
        case OnStreamMentionRemoved = 7
        case OnStreamMentionAdvanceViewTime = 8

        var name: String {
            switch self {
            case .OnClubAdded: return "OnClubAdded"
            case .OnClubRemoved: return "OnClubRemoved"
            case .OnReceivedInvitationAdded: return "OnReceivedInvitationAdded"
            case .OnReceivedInvitationRemoved: return "OnReceivedInvitationRemoved"
            case .OnSharedSettingsChanged: return "OnSharedSettingsChanged"
            case .OnStreamMentionAdded: return "OnStreamMentionAdded"
            case .OnStreamMentionRemoved: return "OnStreamMentionRemoved"
            case .OnStreamMentionAdvanceViewTime: return "OnStreamMentionAdvanceViewTime"
            }
        }

        var responseType: Message.Type {
            switch self {
            case .OnClubAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnClubRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnSharedSettingsChanged: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStreamMentionAdded: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStreamMentionRemoved: return Bgs_Protocol_NO_RESPONSE.self
            case .OnStreamMentionAdvanceViewTime: return Bgs_Protocol_NO_RESPONSE.self
            }
        }

        var requestType: Message.Type {
            switch self {
            case .OnClubAdded: return Bgs_Protocol_Club_V1_Membership_ClubAddedNotification.self
            case .OnClubRemoved: return Bgs_Protocol_Club_V1_Membership_ClubRemovedNotification.self
            case .OnReceivedInvitationAdded: return Bgs_Protocol_Club_V1_Membership_ReceivedInvitationAddedNotification.self
            case .OnReceivedInvitationRemoved: return Bgs_Protocol_Club_V1_Membership_ReceivedInvitationRemovedNotification.self
            case .OnSharedSettingsChanged: return Bgs_Protocol_Club_V1_Membership_SharedSettingsChangedNotification.self
            case .OnStreamMentionAdded: return Bgs_Protocol_Club_V1_Membership_StreamMentionAddedNotification.self
            case .OnStreamMentionRemoved: return Bgs_Protocol_Club_V1_Membership_StreamMentionRemovedNotification.self
            case .OnStreamMentionAdvanceViewTime: return Bgs_Protocol_Club_V1_Membership_StreamMentionAdvanceViewTimeNotification.self
            }
        }

        var id: UInt32 {
            return UInt32(self.rawValue)
        }
    }

    static let name = "bnet.protocol.club.v1.ClubMembershipListener"

    let messageQueue: AuroraMessageQueue
    let eventLoop: EventLoop

    weak var delegate: Bnet_Protocol_Club_V1_ClubMembershipListenerHandler?

    init(eventLoop: EventLoop, messageQueue: AuroraMessageQueue) {
        self.eventLoop = eventLoop
        self.messageQueue = messageQueue
    }

    static func method(with id: UInt32) throws -> MethodType {
        guard let method = Method(id: id) else {
            throw ServiceTypeError.unknownMethodForService(method: id)
        }

        return method
    }
}

extension Bnet_Protocol_Club_V1_ClubMembershipListener {
    func handle(method: MethodType, request: Message?) -> EventLoopFuture<SwiftProtobuf.Message> {
        do {
            guard let delegate = self.delegate else {
                throw ServiceTypeError.missingDelegateForService(service: self)
            }

            guard let typedMethod = method as? Method else {
                throw ServiceTypeError.unexpectedMethodType(expected: Method.self, received: type(of: method))
            }

            switch typedMethod {
            case .OnClubAdded:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_ClubAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_ClubAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnClubAdded(request: message).map { $0 as Message }

            case .OnClubRemoved:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_ClubRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_ClubRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnClubRemoved(request: message).map { $0 as Message }

            case .OnReceivedInvitationAdded:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_ReceivedInvitationAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_ReceivedInvitationAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnReceivedInvitationAdded(request: message).map { $0 as Message }

            case .OnReceivedInvitationRemoved:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_ReceivedInvitationRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_ReceivedInvitationRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnReceivedInvitationRemoved(request: message).map { $0 as Message }

            case .OnSharedSettingsChanged:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_SharedSettingsChangedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_SharedSettingsChangedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnSharedSettingsChanged(request: message).map { $0 as Message }

            case .OnStreamMentionAdded:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_StreamMentionAddedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_StreamMentionAddedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnStreamMentionAdded(request: message).map { $0 as Message }

            case .OnStreamMentionRemoved:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_StreamMentionRemovedNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_StreamMentionRemovedNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnStreamMentionRemoved(request: message).map { $0 as Message }

            case .OnStreamMentionAdvanceViewTime:

                guard let message = request as? Bgs_Protocol_Club_V1_Membership_StreamMentionAdvanceViewTimeNotification else {
                    throw ServiceTypeError.unexpectedMessageType(
                        expected: Bgs_Protocol_Club_V1_Membership_StreamMentionAdvanceViewTimeNotification.self,
                        received: type(of: request)
                    )
                }
                return delegate.OnStreamMentionAdvanceViewTime(request: message).map { $0 as Message }
            }
        } catch let error {
            return self.eventLoop.makeFailedFuture(error)
        }
    }
}

protocol Bnet_Protocol_Club_V1_ClubMembershipListenerHandler: AnyObject {
    var eventLoop: EventLoop { get }

    func OnClubAdded(request: Bgs_Protocol_Club_V1_Membership_ClubAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnClubRemoved(request: Bgs_Protocol_Club_V1_Membership_ClubRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnReceivedInvitationAdded(request: Bgs_Protocol_Club_V1_Membership_ReceivedInvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnReceivedInvitationRemoved(request: Bgs_Protocol_Club_V1_Membership_ReceivedInvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnSharedSettingsChanged(request: Bgs_Protocol_Club_V1_Membership_SharedSettingsChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnStreamMentionAdded(request: Bgs_Protocol_Club_V1_Membership_StreamMentionAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnStreamMentionRemoved(request: Bgs_Protocol_Club_V1_Membership_StreamMentionRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>

    func OnStreamMentionAdvanceViewTime(request: Bgs_Protocol_Club_V1_Membership_StreamMentionAdvanceViewTimeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE>
}

extension Bnet_Protocol_Club_V1_ClubMembershipListenerHandler {
    func OnClubAdded(request: Bgs_Protocol_Club_V1_Membership_ClubAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnClubAdded,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnClubRemoved(request: Bgs_Protocol_Club_V1_Membership_ClubRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnClubRemoved,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnReceivedInvitationAdded(request: Bgs_Protocol_Club_V1_Membership_ReceivedInvitationAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnReceivedInvitationAdded,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnReceivedInvitationRemoved(request: Bgs_Protocol_Club_V1_Membership_ReceivedInvitationRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnReceivedInvitationRemoved,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnSharedSettingsChanged(request: Bgs_Protocol_Club_V1_Membership_SharedSettingsChangedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnSharedSettingsChanged,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnStreamMentionAdded(request: Bgs_Protocol_Club_V1_Membership_StreamMentionAddedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnStreamMentionAdded,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnStreamMentionRemoved(request: Bgs_Protocol_Club_V1_Membership_StreamMentionRemovedNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnStreamMentionRemoved,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }

    func OnStreamMentionAdvanceViewTime(request: Bgs_Protocol_Club_V1_Membership_StreamMentionAdvanceViewTimeNotification)
        -> EventLoopFuture<Bgs_Protocol_NO_RESPONSE> {
        self.eventLoop.makeFailedFuture(
            MethodTypeError.unimplementedMethod(
                method: Bnet_Protocol_Club_V1_ClubMembershipListener.Method.OnStreamMentionAdvanceViewTime,
                of: Bnet_Protocol_Club_V1_ClubMembershipListener.self
            )
        )
    }
}
