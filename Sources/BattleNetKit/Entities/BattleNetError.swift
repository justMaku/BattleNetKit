//
//  BattleNetError.swift
//  BattleNetKit
//
//  Created by Michał Kałużny on 19.08.17.
//

import Foundation

enum BattleNetError: UInt32, Error
{
    case ok = 0
    case `internal` = 1
    case timedOut = 2
    case denied = 3
    case notExists = 4
    case notStarted = 5
    case inProgress = 6
    case invalidArgs = 7
    case invalidSubscriber = 8
    case waitingForDependency = 9
    case noAuth = 10
    case parentalControlRestriction = 11
    case noGameAccount = 12
    case notImplemented = 13
    case objectRemoved = 14
    case invalidEntityId = 15
    case invalidEntityAccountId = 16
    case invalidEntityGameAccountId = 17
    case invalidAgentId = 19
    case invalidTargetId
    case moduleNotLoaded
    case moduleNoEntryPoint
    case moduleSignatureIncorrect
    case moduleCreateFailed
    case noProgram
    case apiNotBound
    case apiNotReady
    case badVersion
    case attributeTooManyAttributesSet
    case attributeMaxSizeExceeded
    case attributeQuotaExceeded
    case serverPoolServerDisappeared
    case serverIsPrivate
    case disabled
    case moduleNotFound = 36
    case serverBusy
    case noBattletag
    case incompleteProfanityFilters
    case invalidRegion
    case existsAlready
    case invalidServerThumbprint
    case phoneLock
    case squelched
    case targetOffline
    case badServer
    case noCookie
    case expiredCookie
    case tokenNotFound
    case gameAccountNoTime
    case gameAccountNoPlan
    case gameAccountBanned
    case gameAccountSuspended
    case gameAccountAlreadySelected
    case gameAccountCancelled
    case sessionDuplicate = 60
    case sessionDisconnected
    case sessionDataChanged
    case sessionUpdateFailed
    case sessionNotFound
    case adminKick = 70
    case unplannedMaintenance
    case plannedMaintenance
    case serviceFailureAccount
    case serviceFailureSession
    case serviceFailureAuth
    case serviceFailureRisk
    case badProgram
    case badLocale
    case badPlatform
    case localeRestrictedLa = 81
    case localeRestrictedR
    case localeRestrictedKo
    case localeRestrictedTw
    case localeRestricted
    case accountNeedsMaintenance
    case moduleApiError
    case moduleBadCacheHandle
    case moduleAlreadyLoaded
    case networkBlacklisted
    case okDeprecated = 100
    case logonModuleRequired = 500
    case logonModuleNotConfigured
    case logonModuleTimeout
    case logonAgreementRequired = 510
    case logonAgreementNotConfigured
    case logonInvalidServerProof = 520
    case logonWebVerifyTimeout
    case challengeSmsTooSoon = 600
    case challengeSmsThrottled
    case challengeSmsTempOutage
    case challengeNoChallenge
    case challengeNotPicked
    case challengeAlreadyPicked
    case challengeInProgress
    case rpcWriteFailed = 3000
    case rpcServiceNotBound
    case rpcTooManyRequests
    case rpcPeerUnknown
    case rpcPeerUnavailable
    case rpcPeerDisconnected
    case rpcRequestTimedOut
    case rpcConnectionTimedOut
    case rpcMalformedResponse
    case rpcAccessDenied
    case rpcInvalidService
    case rpcInvalidMethod
    case rpcInvalidObject
    case rpcMalformedRequest
    case rpcQuotaExceeded
    case rpcNotImplemented
    case rpcServerError
    case rpcShutdown
    case rpcDisconnect
    case rpcDisconnectIdle
    case rpcProtocolError
    case rpcNotReady
    case rpcForwardFailed
    case rpcEncryptionFailed
    case rpcInvalidAddress
    case rpcMethodDisabled
    case rpcShardNotFound
    case presenceInvalidFieldId = 4000
    case presenceNoValidSubscribers
    case presenceAlreadySubscribed
    case presenceConsumerNotFound
    case presenceConsumerIsNull
    case presenceTemporaryOutage
    case friendsTooManySentInvitations = 5001
    case friendsTooManyReceivedInvitations
    case friendsFriendshipAlreadyExists
    case friendsFriendshipDoesNotExist
    case friendsInvitationAlreadyExists
    case friendsInvalidInvitation
    case friendsAlreadySubscribed
    case friendsAccountBlocked = 5009
    case friendsNotSubscribed
    case friendsInvalidRoleId
    case friendsDisabledRoleId
    case friendsNoteMaxSizeExceeded
    case friendsUpdateFriendStateFailed
    case friendsInviteeAtMaxFriends
    case friendsInviterAtMaxFriends
    case whisperUndeliverable = 7000
    case whisperMaxSizeExceeded
    case userManagerAlreadyBlocked = 8000
    case userManagerNotBlocked
    case userManagerCannotBlockSelf
    case userManagerAlreadyRegistered
    case userManagerNotRegistered
    case userManagerTooManyBlockedEntities
    case userManagerTooManyIds = 8007
    case userManagerBlockRecordUnavailable = 8015
    case userManagerBlockEntityFailed
    case userManagerUnblockEntityFailed
    case userManagerCannotBlockFriend = 8019
    case channelFull = 10000
    case channelNoChannel
    case channelNotMember
    case channelAlreadyMember
    case channelNoSuchMember
    case channelInvalidChannelId = 10006
    case channelNoSuchInvitation = 10008
    case channelTooManyInvitations
    case channelInvitationAlreadyExists
    case channelInvalidChannelSize
    case channelInvalidRoleId
    case channelRoleNotAssignable
    case channelInsufficientPrivileges
    case channelInsufficientPrivacyLevel
    case channelInvalidPrivacyLevel
    case channelTooManyChannelsJoined
    case channelInvitationAlreadySubscribed
    case channelInvalidChannelDelegate
    case channelSlotAlreadyReserved
    case channelSlotNotReserved
    case channelNoReservedSlotsAvailable
    case channelInvalidRoleSet
    case channelRequireFriendValidation
    case channelMemberOffline
    case channelReceivedTooManyInvitations
    case channelInvitationInvalidGameAccountSelected
    case channelUnreachable
    case channelInvitationNotSubscribed
    case channelInvalidMessageSize
    case channelMaxMessageSizeExceeded
    case channelConfigNotFound
    case channelInvalidChannelType
    case localStorageFileOpenError = 11000
    case localStorageFileCreateError
    case localStorageFileReadError
    case localStorageFileWriteError
    case localStorageFileDeleteError
    case localStorageFileCopyError
    case localStorageFileDecompressError
    case localStorageFileHashMismatch
    case localStorageFileUsageMismatch
    case localStorageDatabaseInitError
    case localStorageDatabaseNeedsRebuild
    case localStorageDatabaseInsertError
    case localStorageDatabaseLookupError
    case localStorageDatabaseUpdateError
    case localStorageDatabaseDeleteError
    case localStorageDatabaseShrinkError
    case localStorageCacheCrawlError
    case localStorageDatabaseIndexTriggerError
    case localStorageDatabaseRebuildInProgress
    case localStorageOkButNotInCache
    case localStorageFileRenameError
    case localStorageDatabaseRebuildInterrupted
    case localStorageDatabaseNotInitialized
    case localStorageDirectoryCreateError
    case localStorageFilekeyNotFound
    case accountMissingConfig = 18000
    case accountDataNotFound
    case accountAlreadySubscribed
    case accountNotSubscribed
    case accountFailedToParseTimezoneData
    case accountLoadFailed
    case accountLoadCancelled
    case accountDatabaseInvalidateFailed
    case accountCacheInvalidateFailed
    case accountSubscriptionPending
    case accountUnknownRegion
    case accountDataFailedToParse
    case databaseBindingCountMismatch = 19000
    case databaseBindingParseFail
    case databaseResultsetColumnsMismatch
    case databaseDeadlock
    case databaseDuplicateKey
    case databaseCannotConnect
    case databaseStatementFailed
    case databaseTransactionNotStarted
    case databaseTransactionNotEnded
    case databaseTransactionLeak
    case databaseTransactionStateBad
    case databaseServerGone
    case databaseBindingNotNullable = 19100
    case databaseBindingInvalidInteger
    case databaseBindingInvalidFloat
    case databaseBindingInvalidTemporal
    case databaseBindingInvalidProtobuf
    case partyInvalidPartyId = 20000
    case partyAlreadyInParty
    case partyNotInParty
    case partyInvitationUndeliverable
    case partyInvitationAlreadyExists
    case partyTooManyPartyInvitations
    case partyTooManyReceivedInvitations
    case partyNoSuchType
    case gamesNoSuchFactory = 22000
    case gamesNoSuchGame
    case gamesNoSuchRequest
    case gamesNoSuchPartyMember
    case resourcesOffline = 23000
    case gameServerCreateGameRefused = 24000
    case gameServerAddPlayersRefused
    case gameServerRemovePlayersRefused
    case gameServerFinishGameRefused
    case gameServerNoSuchGame
    case gameServerNoSuchPlayer
    case gameServerCreateGameRefusedTransient = 24050
    case gameServerAddPlayersRefusedTransient
    case gameServerRemovePlayersRefusedTransient
    case gameServerFinishGameRefusedTransient
    case gameServerCreateGameRefusedBusy = 24100
    case gameServerAddPlayersRefusedBusy
    case gameServerRemovePlayersRefusedBusy
    case gameServerFinishGameRefusedBusy
    case gameServerNoServer = 24200
    case gameMasterInvalidFactory = 25000
    case gameMasterInvalidGame
    case gameMasterGameFull
    case gameMasterRegisterFailed
    case gameMasterNoGameServer
    case gameMasterNoUtilityServer
    case gameMasterNoGameVersion
    case gameMasterGameJoinFailed
    case gameMasterAlreadyRegistered
    case gameMasterNoFactory
    case gameMasterMultipleGameVersions
    case gameMasterInvalidPlayer
    case gameMasterInvalidGameRequest
    case gameMasterInsufficientPrivileges
    case gameMasterAlreadyInGame
    case gameMasterInvalidGameServerResponse
    case gameMasterGameAccountLookupFailed
    case gameMasterGameEntryCancelled
    case gameMasterGameEntryAbortedClientDropped
    case gameMasterGameEntryAbortedByService
    case gameMasterNoAvailableCapacity
    case gameMasterInvalidTeamid
    case notificationInvalidClientId = 26000
    case notificationDuplicateName
    case notificationNameNotFound
    case notificationInvalidServer
    case notificationQuotaExceeded
    case notificationInvalidNotificationType
    case achievementsNothingToUpdate = 28000
    case achievementsInvalidParams
    case achievementsNotRegistered
    case achievementsNotReady
    case achievementsFailedToParseStaticData
    case achievementsUnknownId
    case achievementsMissingSnapshot
    case achievementsAlreadyRegistered
    case achievementsTooManyRegistrations
    case achievementsAlreadyInProgress
    case achievementsTemporaryOutage
    case achievementsInvalidProgramid
    case achievementsMissingRecord
    case achievementsRegistrationPending
    case achievementsEntityIdNotFound
    case achievementsAchievementIdNotFound
    case achievementsCriteriaIdNotFound
    case achievementsStaticDataMismatch
    case achievementsWrongThread
    case achievementsCallbackIsNull
    case achievementsAutoRegisterPending
    case achievementsNotInitialized
    case achievementsAchievementIdAlreadyExists
    case achievementsFailedToDownloadStaticData
    case searchInvalidRange = 29002
    case searchDisabled
    case searchUniverseNotLicensed
    case searchUniverseDisabledLicense
    case searchTooManyResults
    case searchRefusedBusy
    case exchangeObjectProviderValidateOrderBookRefusedTransient = 30002
    case exchangeObjectProviderAuthorizeRefusedTransient
    case exchangeObjectProviderSettleRefusedTransient
    case exchangeObjectProviderCancelRefusedTransient
    case exchangeObjectProviderGetObjectStatisticsRefusedTransient
    case exchangeObjectProviderGetPaymentMethodsRefusedTransient
    case exchange = 31000
    case exchangeAlreadyExists
    case exchangeOrderBookCreationFailed
    case exchangeOrderBookNotFound
    case exchangeObjectNotValid
    case exchangeAccountNotValid
    case exchangeOrderBookClosed
    case exchangeCannotBidOnOwnOffer
    case exchangeInvalidToken
    case exchangeSubscriptionFailed
    case exchangeAlreadySubscribed
    case exchangeNotSubscribed
    case exchangeSourceInvalid
    case exchangeTypeInvalid
    case exchangeNoObjectProviders = 31015
    case exchangePartitionIdInvalid
    case exchangeSpecialistInvalid
    case exchangeCurrencyInvalid
    case exchangeDurationInvalid
    case exchangeStartDelayInvalid
    case exchangeStartingPriceInvalid
    case exchangeReservedPriceInvalid
    case exchangeTradeNowPriceInvalid
    case exchangeDisabled
    case exchangeSpecialistDisabled
    case exchangeOrderactionDisabled
    case exchangeOrdertypeDisabled
    case exchangeSourceDisabled
    case exchangeOfferNotFound
    case exchangeBidNotFound
    case exchangeOrderBookIdMismatched
    case exchangeCancelReasonInvalid
    case exchangeObjectTypeInvalid
    case exchangeTooManyResults
    case exchangeDisabledLicense
    case exchangeCurrencyNotLicensed
    case exchangeCurrencyMismatched
    case exchangeProgramInvalid
    case exchangeAmountInvalid
    case exchangeOrderInvalid
    case exchangeCurrentPriceInvalid
    case exchangeMaximumPriceInvalid
    case exchangeCurrencyDisabled
    case exchangeAmountInvalidTicksize = 31045
    case exchangeNotclosedOfferLimitReached
    case exchangeCurrencyRmtRestricted
    case exchangeOrderWithClaimableLimitReached
    case exchangeStartingPriceMinUnitPriceInvalid
    case exchangeStartingPriceMaxUnitPriceInvalid
    case exchangeStartingPriceMinTotalPriceInvalid
    case exchangeStartingPriceMaxTotalPriceInvalid
    case exchangeReservedPriceMinUnitPriceInvalid
    case exchangeReservedPriceMaxUnitPriceInvalid
    case exchangeReservedPriceMinTotalPriceInvalid
    case exchangeReservedPriceMaxTotalPriceInvalid
    case exchangeTradeNowPriceMinUnitPriceInvalid
    case exchangeTradeNowPriceMaxUnitPriceInvalid
    case exchangeTradeNowPriceMinTotalPriceInvalid
    case exchangeTradeNowPriceMaxTotalPriceInvalid
    case exchangeCurrentPriceMinUnitPriceInvalid
    case exchangeCurrentPriceMaxUnitPriceInvalid
    case exchangeCurrentPriceMinTotalPriceInvalid
    case exchangeCurrentPriceMaxTotalPriceInvalid
    case exchangeMaximumPriceMinUnitPriceInvalid
    case exchangeMaximumPriceMaxUnitPriceInvalid
    case exchangeMaximumPriceMinTotalPriceInvalid
    case exchangeMaximumPriceMaxTotalPriceInvalid
    case exchangeInvalidFillOrKillBid
    case exchangeRequestInprocess
    case exchangeBidAuthorizeInprogress
    case exchangeOfferAuthorizeInprogress
    case exchangePartitionBusy
    case exchangeSubscribeRequestRefusedBusy
    case exchangeBusy
    case exchangeAccessNotGranted
    case exchangeStatusInvalid
    case exchangeNotificationTypeInvalid
    case exchangeDatabase = 32000
    case exchangeDatabaseMaintenance
    case exchangeDatabaseUsercancel
    case exchangeDatabaseOutbid
    case exchangeDatabaseInsufficientamount
    case exchangeDatabaseTotalpricetoolow
    case exchangeDatabaseCloseforfillorkill
    case exchangeDatabaseUnknownspecialist = 32100
    case exchangeDatabaseDatanotfound
    case exchangeDatabaseDuplicatedata
    case exchangeDatabaseAlreadycanceled
    case exchangeDatabaseOrderstillactive
    case exchangeDatabaseAuthorizationfailed
    case exchangeDatabaseAlreadycompleted
    case exchangeDatabaseEndtimenotpassed
    case exchangeDatabaseTradenowpricereached
    case exchangeDatabaseInsufficientmaxunitprice
    case exchangeDatabaseNotenoughunitprice
    case exchangeDatabaseZeroamount
    case exchangeDatabaseSettleamountmismatch
    case exchangeDatabaseStarttimenotpassed
    case exchangeDatabaseLessthanreserveprice
    case exchangeDatabaseNotauthorized
    case exchangeDatabaseNotimplemented
    case exchangeDatabaseLessthanoutbidprice
    case exchangeDatabaseRecordnotfound
    case exchangeDatabaseParentsettlefailed
    case exchangeDatabaseInvalidoperation
    case exchangeDatabaseRiskpending
    case exchangeDatabaseRefundnotfound
    case exchangeDatabaseSettlepending
    case exchangeDatabaseRiskfailed
    case exchangeDatabaseOrderbooknotfound = 32200
    case exchangeDatabaseOrderbookclosefailed
    case exchangeDatabaseOrderbookinvalidid
    case exchangeDatabaseOrderbookclosed
    case exchangeDatabaseOrderbookdupactive
    case exchangeDatabaseOffernotfound = 32300
    case exchangeDatabaseOffercanceled
    case exchangeDatabaseOfferclosed
    case exchangeDatabaseOffernotactivated
    case exchangeDatabaseOfferauthnotfound
    case exchangeDatabaseOfferauthinprocess
    case exchangeDatabaseOffercancelnotfound
    case exchangeDatabaseOffersettlenotfound
    case exchangeDatabaseOfferexpired
    case exchangeDatabaseOfferalreadyexists
    case exchangeDatabaseOfferbadowner
    case exchangeDatabaseBidnotfound = 32400
    case exchangeDatabaseBidalreadyexists
    case exchangeDatabaseBidfromsameaccount
    case exchangeDatabaseBidauthnotfound
    case exchangeDatabaseBidcancelnotfound
    case exchangeDatabaseBidsettlenotfound
    case exchangeDatabaseBidclosed
    case exchangeDatabaseBidcanceled
    case exchangeDatabaseBidexpired
    case exchangeDatabaseBidauthinprocess
    case exchangeDatabaseBidbadowner
    case exchangeDatabaseFeecouponnegative = 32500
    case exchangeDatabaseFeeinactive
    case exchangeDatabaseFeeeventnotfound
    case exchangeDatabaseFeeeventtoomany
    case exchangeDatabaseCouponnotfound
    case exchangeDatabaseCouponbooknotfound
    case exchangeDatabaseOrderinvalidaddress = 32550
    case exchangeDatabaseCscancelstart = 32600
    case exchangeDatabaseCscancelend = 32699
    case exchangeDatabaseExceptionNotspecified = 33000
    case exchangeDatabaseExceptionNotenoughdefinitions
    case exchangeDatabaseExceptionBadpartitionid = 33010
    case exchangeDatabaseExceptionBadorderbookid
    case exchangeDatabaseExceptionBadprogress
    case exchangeDatabaseExceptionBadsettleamount
    case exchangeDatabaseExceptionBadofferid = 33100
    case exchangeDatabaseExceptionBadofferamount
    case exchangeDatabaseExceptionBadofferpricing
    case exchangeDatabaseExceptionBadoffertiming
    case exchangeDatabaseExceptionBadoffermoneyaccount
    case exchangeDatabaseExceptionBadofferitemaccount
    case exchangeDatabaseExceptionBadoffersettleamount
    case exchangeDatabaseExceptionBadoffersettleprice
    case exchangeDatabaseExceptionBadbidid = 33200
    case exchangeDatabaseExceptionBadbidamount
    case exchangeDatabaseExceptionBadbidpricing
    case exchangeDatabaseExceptionBadbidtiming
    case exchangeDatabaseExceptionBadbidmoneyaccount
    case exchangeDatabaseExceptionBadbiditemaccount
    case exchangeDatabaseExceptionBadbidsettleamount
    case exchangeDatabaseExceptionBadbidsettleprice
    case exchangeDatabaseExceptionBadbiddingbnetid
    case exchangeDatabaseExceptionBadfeecalculationtype
    case exchangeDatabaseExceptionBadfeecouponcount
    case gameUtilityServerVariableRequestRefused = 34001
    case gameUtilityServerWrongNumberOfVariablesReturned
    case gameUtilityServerClientRequestRefused
    case gameUtilityServerPresenceChannelCreatedRefused
    case gameUtilityServerVariableRequestRefusedTransient = 34050
    case gameUtilityServerClientRequestRefusedTransient
    case gameUtilityServerPresenceChannelCreatedRefusedTransient
    case gameUtilityServerServerRequestRefusedTransient
    case gameUtilityServerVariableRequestRefusedBusy = 34100
    case gameUtilityServerClientRequestRefusedBusy
    case gameUtilityServerPresenceChannelCreatedRefusedBusy
    case gameUtilityServerServerRequestRefusedBusy
    case gameUtilityServerNoServer = 34200
    case gameChannelInvalidGameId = 35000
    case exchangePayment = 36000
    case exchangePaymentBridgeTimeout
    case exchangePaymentCorruptAuthHandle
    case exchangePaymentInvalidRequest
    case exchangePaymentCashOutNotAllowed
    case exchangePaymentInvalidTransactionDirection
    case exchangePaymentInsufficientFunds
    case exchangePaymentDecryptFailed
    case exchangePaymentLimitedByMaxCapAmount
    case exchangePaymentBridgeDisconnectedFromPaymentProvider
    case exchangePaymentCouldntConnect
    case exchangePaymentAuthExpired
    case exchangePaymentPaypalTxNotFound
    case exchangePaymentPaypalUnexpectedStatus
    case exchangePaymentBridgeInternalDeprecated
    case exchangePaymentPaypalMasspayUnknownState
    case exchangePaymentPaypalMasspayShouldRetry
    case exchangePaymentGcUnexpectedStatus
    case exchangePaymentOrderIdRunningOut
    case exchangePaymentAccountSourceMismatch
    case exchangePaymentResultOffsetInUse
    case exchangePaymentWalletNotFound
    case exchangePaymentCurrencyNotFound
    case exchangePaymentMalformedResponse = 36024
    case exchangePaymentCvvNotPresent
    case exchangePaymentAvsCheckFailed
    case exchangePaymentCvvCheckFailed
    case exchangePaymentZipCodeTooShort
    case exchangePaymentZipCodeTooLong
    case exchangePaymentZipCodeRepeatingDigitsNotAllowed
    case exchangePaymentZipCodeInvalid
    case exchangePaymentAuthenticatorCapViolation
    case exchangePaymentSoftCapViolation
    case exchangePaymentUnknownAccount
    case exchangePaymentPaypalMasspayResetInProcessFailed
    case exchangePaymentUnsupportedPaymentMethod
    case exchangePaymentUnknownError
    case exchangePaymentShuttingDown
    case exchangePaymentMissingSmsSignup
    case exchangePaymentEbalanceInternal
    case exchangePaymentRequestTimedOutInProvider
    case exchangePaymentRequestUnknownState
    case exchangePaymentAccountCompromised
    case exchangePaymentReportFailed
    case exchangePaymentInvaidProviderId
    case exchangePaymentDatabase = 37000
    case exchangePaymentDatabaseThisErrorCodeIsDeprecated
    case exchangePaymentDatabaseBadProgressCount
    case exchangePaymentDatabaseNoDataFound
    case exchangePaymentDatabaseAlreadyCompleted
    case exchangePaymentDatabaseDuplicatedData
    case exchangePaymentDatabaseInvalidOperationType
    case exchangePaymentDatabaseNoSettleForRefund
    case exchangePaymentDatabaseRefundExceedsSettle
    case exchangePaymentDatabaseAlreadySuccess
    case exchangePaymentDatabaseAlreadyInProcess
    case exchangePaymentDatabaseInvalidFundAmount
    case exchangePaymentDatabasePartialFilled
    case exchangePaymentDatabaseInvalidProviderId = 37100
    case exchangePaymentDatabaseExceptionAssertConditionFailed = 38000
    case exchangePaymentDatabaseExceptionBadProviderRequestId
    case exchangePaymentDatabaseExceptionBadAuthorization
    case exchangePaymentDatabaseExceptionBadSettle
    case exchangePaymentDatabaseExceptionBadProgressCount
    case exchangePaymentDatabaseExceptionBadTotalProgressCount
    case exchangePaymentDatabaseExceptionNative = 38100
    case exchangePaymentDatabaseExceptionNotSpecified
    case exchangeSearchInputNoObjectProviders = 40000
    case exchangeSearchInputDuplicateStatisticsKey
    case identityInsufficientData = 41000
    case identityTooManyResults
    case identityBadId
    case identityNoAccountBlob
    case riskChallengeAction = 42000
    case riskDelayAction
    case riskThrottleAction
    case riskAccountLocked
    case riskCsDenied
    case portDisabled = 43000
    case portExchangeReasonInvalid = 43100
    case reportUnavailable = 45000
    case reportTooLarge
    case reportUnknownType
    case reportAttributeInvalid
    case reportAttributeQuotaExceeded
    case reportUnconfirmed
    case reportNotConnected
    case reportRejected
    case reportTooManyRequest
}
