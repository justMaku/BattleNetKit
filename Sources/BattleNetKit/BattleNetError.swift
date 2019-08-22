import Foundation

enum BattleNetError: Int64, Error {
    case ok = 0x0000_0000
    case `internal` = 0x0000_0001
    case timedOut = 0x0000_0002
    case denied = 0x0000_0003
    case notExists = 0x0000_0004
    case notStarted = 0x0000_0005
    case inProgress = 0x0000_0006
    case invalidArgs = 0x0000_0007
    case invalidSubscriber = 0x0000_0008
    case waitingForDependency = 0x0000_0009
    case noAuth = 0x0000_000a
    case parentalControlRestriction = 0x0000_000b
    case noGameAccount = 0x0000_000c
    case notImplemented = 0x0000_000d
    case objectRemoved = 0x0000_000e
    case invalidEntityId = 0x0000_000f
    case invalidEntityAccountId = 0x0000_0010
    case invalidEntityGameAccountId = 0x0000_0011
    case invalidAgentId = 0x0000_0013
    case invalidTargetId = 0x0000_0014
    case moduleNotLoaded = 0x0000_0015
    case moduleNoEntryPoint = 0x0000_0016
    case moduleSignatureIncorrect = 0x0000_0017
    case moduleCreateFailed = 0x0000_0018
    case noProgram = 0x0000_0019
    case apiNotReady = 0x0000_001b
    case badVersion = 0x0000_001c
    case attributeTooManyAttributesSet = 0x0000_001d
    case attributeMaxSizeExceeded = 0x0000_001e
    case attributeQuotaExceeded = 0x0000_001f
    case serverPoolServerDisappeared = 0x0000_0020
    case serverIsPrivate = 0x0000_0021
    case disabled = 0x0000_0022
    case moduleNotFound = 0x0000_0024
    case serverBusy = 0x0000_0025
    case noBattletag = 0x0000_0026
    case incompleteProfanityFilters = 0x0000_0027
    case invalidRegion = 0x0000_0028
    case existsAlready = 0x0000_0029
    case invalidServerThumbprint = 0x0000_002a
    case phoneLock = 0x0000_002b
    case squelched = 0x0000_002c
    case targetOffline = 0x0000_002d
    case badServer = 0x0000_002e
    case noCookie = 0x0000_002f
    case expiredCookie = 0x0000_0030
    case tokenNotFound = 0x0000_0031
    case gameAccountNoTime = 0x0000_0032
    case gameAccountNoPlan = 0x0000_0033
    case gameAccountBanned = 0x0000_0034
    case gameAccountSuspended = 0x0000_0035
    case gameAccountAlreadySelected = 0x0000_0036
    case gameAccountCancelled = 0x0000_0037
    case gameAccountCreationDisabled = 0x0000_0038
    case gameAccountLocked = 0x0000_0039
    case gameAccountPhoneLock = 0x0000_003a
    case gameAccountBillingLock = 0x0000_003b
    case sessionDuplicate = 0x0000_003c
    case sessionDisconnected = 0x0000_003d
    case sessionDataChanged = 0x0000_003e
    case sessionUpdateFailed = 0x0000_003f
    case sessionNotFound = 0x0000_0040
    case sessionFreePlayNotSupported = 0x0000_0041
    case sessionSubscriptionAdded = 0x0000_0042
    case sessionConsumptionTimeAdded = 0x0000_0043
    case adminKick = 0x0000_0046
    case unplannedMaintenance = 0x0000_0047
    case plannedMaintenance = 0x0000_0048
    case serviceFailureAccount = 0x0000_0049
    case serviceFailureSession = 0x0000_004a
    case serviceFailureAuth = 0x0000_004b
    case serviceFailureRisk = 0x0000_004c
    case badProgram = 0x0000_004d
    case badLocale = 0x0000_004e
    case badPlatform = 0x0000_004f
    case localeRestrictedLa = 0x0000_0051
    case localeRestrictedRu = 0x0000_0052
    case localeRestrictedKo = 0x0000_0053
    case localeRestrictedTw = 0x0000_0054
    case localeRestricted = 0x0000_0055
    case accountNeedsMaintenance = 0x0000_0056
    case moduleApiError = 0x0000_0057
    case moduleBadCacheHandle = 0x0000_0058
    case moduleAlreadyLoaded = 0x0000_0059
    case networkBlacklisted = 0x0000_005a
    case eventProcessorSlow = 0x0000_005b
    case serverShuttingDown = 0x0000_005c
    case networkNotPrivileged = 0x0000_005d
    case tooManyOutstandingRequests = 0x0000_005e
    case noAccountRegistered = 0x0000_005f
    case battlenetAccountBanned = 0x0000_0060
    case okDeprecated = 0x0000_0064
    case serverInModeZombie = 0x0000_0065
    case agentIsBlockingTarget = 0x0000_0066
    case targetIsBlockingAgent = 0x0000_0067
    case serviceUnavailable = 0x0000_0068
    case logonModuleRequired = 0x0000_01f4
    case logonModuleNotConfigured = 0x0000_01f5
    case logonModuleTimeout = 0x0000_01f6
    case logonAgreementRequired = 0x0000_01fe
    case logonAgreementNotConfigured = 0x0000_01ff
    case challengeSmsTooSoon = 0x0000_0258
    case challengeSmsThrottled = 0x0000_0259
    case challengeSmsTempOutage = 0x0000_025a
    case challengeNoChallenge = 0x0000_025b
    case challengeNotPicked = 0x0000_025c
    case challengeAlreadyPicked = 0x0000_025d
    case challengeInProgress = 0x0000_025e
    case configFormatInvalid = 0x0000_02bc
    case configNotFound = 0x0000_02bd
    case configRetrieveFailed = 0x0000_02be
    case configDumpFailed = 0x0000_02bf
    case networkModuleBusy = 0x0000_03e8
    case networkModuleCantResolveAddress = 0x0000_03e9
    case networkModuleConnectionRefused = 0x0000_03ea
    case networkModuleInterrupted = 0x0000_03eb
    case networkModuleConnectionAborted = 0x0000_03ec
    case networkModuleConnectionReset = 0x0000_03ed
    case networkModuleBadAddress = 0x0000_03ee
    case networkModuleNotReady = 0x0000_03ef
    case networkModuleAlreadyConnected = 0x0000_03f0
    case networkModuleCantCreateSocket = 0x0000_03f1
    case networkModuleNetworkUnreachable = 0x0000_03f2
    case networkModuleSocketPermissionDenied = 0x0000_03f3
    case networkModuleNotInitialized = 0x0000_03f4
    case networkModuleNoSslCertificateForPeer = 0x0000_03f5
    case networkModuleNoSslCommonNameForCertificate = 0x0000_03f6
    case networkModuleSslCommonNameDoesNotMatchRemoteEndpoint = 0x0000_03f7
    case networkModuleSocketClosed = 0x0000_03f8
    case networkModuleSslPeerIsNotRegisteredInCertbundle = 0x0000_03f9
    case networkModuleSslCertBundleReadError = 0x0000_03fb
    case networkModuleNoCertBundle = 0x0000_03fc
    case networkModuleFailedToDownloadCertBundle = 0x0000_03fd
    case networkModuleNotReadyToRead = 0x0000_03fe
    case networkModuleSslCertChainValidationFailed = 0x0000_03ff
    case networkModuleSslCertHandlerWasNotProvided = 0x0000_0400
    case networkModuleNetworkDown = 0x0000_0401
    case networkModuleOpensslX509Ok = 0x0000_04b0
    case networkModuleOpensslX509UnableToGetIssuerCert = 0x0000_04b1
    case networkModuleOpensslX509UnableToGetCrl = 0x0000_04b2
    case networkModuleOpensslX509UnableToDecryptCertSignature = 0x0000_04b3
    case networkModuleOpensslX509UnableToDecryptCrlSignature = 0x0000_04b4
    case networkModuleOpensslX509UnableToDecodeIssuerPublicKey = 0x0000_04b5
    case networkModuleOpensslX509CertSignatureFailure = 0x0000_04b6
    case networkModuleOpensslX509CrlSignatureFailure = 0x0000_04b7
    case networkModuleOpensslX509CertNotYetValid = 0x0000_04b8
    case networkModuleOpensslX509CertHasExpired = 0x0000_04b9
    case networkModuleOpensslX509CrlNotYetValid = 0x0000_04ba
    case networkModuleOpensslX509CrlHasExpired = 0x0000_04bb
    case networkModuleOpensslX509ErrorInCertNotBeforeField = 0x0000_04bc
    case networkModuleOpensslX509ErrorInCertNotAfterField = 0x0000_04bd
    case networkModuleOpensslX509ErrorInCrlLastUpdateField = 0x0000_04be
    case networkModuleOpensslX509ErrorInCrlNextUpdateField = 0x0000_04bf
    case networkModuleOpensslX509OutOfMem = 0x0000_04c0
    case networkModuleOpensslX509DepthZeroSelfSignedCert = 0x0000_04c1
    case networkModuleOpensslX509SelfSignedCertInChain = 0x0000_04c2
    case networkModuleOpensslX509UnableToGetIssuerCertLocally = 0x0000_04c3
    case networkModuleOpensslX509UnableToVerifyLeafSignature = 0x0000_04c4
    case networkModuleOpensslX509CertChainTooLong = 0x0000_04c5
    case networkModuleOpensslX509CertRevoked = 0x0000_04c6
    case networkModuleOpensslX509InvalidCa = 0x0000_04c7
    case networkModuleOpensslX509PathLengthExceeded = 0x0000_04c8
    case networkModuleOpensslX509InvalidPurpose = 0x0000_04c9
    case networkModuleOpensslX509CertUntrusted = 0x0000_04ca
    case networkModuleOpensslX509CertRejected = 0x0000_04cb
    case networkModuleOpensslX509SubjectIssuerMismatch = 0x0000_04cc
    case networkModuleOpensslX509AkidSkidMismatch = 0x0000_04cd
    case networkModuleOpensslX509AkidIssuerSerialMismatch = 0x0000_04ce
    case networkModuleOpensslX509KeyusageNoCertsign = 0x0000_04cf
    case networkModuleOpensslX509ApplicationVerification = 0x0000_04d0
    case networkModuleSchannelCannotFindOsVersion = 0x0000_0514
    case networkModuleSchannelOsNotSupported = 0x0000_0515
    case networkModuleSchannelLoadlibraryFail = 0x0000_0516
    case networkModuleSchannelCannotFindInterface = 0x0000_0517
    case networkModuleSchannelInitFail = 0x0000_0518
    case networkModuleSchannelFunctionCallFail = 0x0000_0519
    case networkModuleSchannelHandshakeFailure = 0x0000_051a
    case networkModuleSchannelX509UnableToGetIssuerCert = 0x0000_0546
    case networkModuleSchannelX509TimeInvalid = 0x0000_0547
    case networkModuleSchannelX509SignatureInvalid = 0x0000_0548
    case networkModuleSchannelX509UnableToVerifyLeafSignature = 0x0000_0549
    case networkModuleSchannelX509SelfSignedLeafCertificate = 0x0000_054a
    case networkModuleSchannelX509UnhandledError = 0x0000_054b
    case networkModuleSchannelX509SelfSignedCertInChain = 0x0000_054c
    case websocketHandshake = 0x0000_0578
    case networkModuleDurangoUnknown = 0x0000_05dc
    case networkModuleDurangoMalformedHostName = 0x0000_05dd
    case networkModuleDurangoInvalidConnectionResponse = 0x0000_05de
    case networkModuleDurangoInvalidCaCert = 0x0000_05df
    case networkModuleDarwinsslFunctionCallFail = 0x0000_0640
    case networkModuleDarwinsslX509NeverTrust = 0x0000_0672
    case networkModuleDarwinsslX509RecoverableTrustFailure = 0x0000_0673
    case networkModuleDarwinsslX509FatalTrustFailure = 0x0000_0674
    case networkModuleDarwinsslX509OtherError = 0x0000_0675
    case networkModuleDarwinsslX509UnknownError = 0x0000_0676
    case sdkMessageHandlerNotFound = 0x0000_076c
    case sdkTassadarClientInvalidInput = 0x0000_0776
    case sdkTassadarServerError = 0x0000_0777
    case sdkTassadarServerMaintenance = 0x0000_0778
    case rpcWriteFailed = 0x0000_0bb8
    case rpcServiceNotBound = 0x0000_0bb9
    case rpcTooManyRequests = 0x0000_0bba
    case rpcPeerUnknown = 0x0000_0bbb
    case rpcPeerUnavailable = 0x0000_0bbc
    case rpcPeerDisconnected = 0x0000_0bbd
    case rpcRequestTimedOut = 0x0000_0bbe
    case rpcConnectionTimedOut = 0x0000_0bbf
    case rpcMalformedResponse = 0x0000_0bc0
    case rpcAccessDenied = 0x0000_0bc1
    case rpcInvalidService = 0x0000_0bc2
    case rpcInvalidMethod = 0x0000_0bc3
    case rpcInvalidObject = 0x0000_0bc4
    case rpcMalformedRequest = 0x0000_0bc5
    case rpcQuotaExceeded = 0x0000_0bc6
    case rpcNotImplemented = 0x0000_0bc7
    case rpcServerError = 0x0000_0bc8
    case rpcShutdown = 0x0000_0bc9
    case rpcDisconnect = 0x0000_0bca
    case rpcDisconnectIdle = 0x0000_0bcb
    case rpcProtocolError = 0x0000_0bcc
    case rpcNotReady = 0x0000_0bcd
    case rpcForwardFailed = 0x0000_0bce
    case rpcEncryptionFailed = 0x0000_0bcf
    case rpcInvalidAddress = 0x0000_0bd0
    case rpcMethodDisabled = 0x0000_0bd1
    case rpcShardNotFound = 0x0000_0bd2
    case rpcInvalidConnectionId = 0x0000_0bd3
    case rpcNotConnected = 0x0000_0bd4
    case rpcInvalidConnectionState = 0x0000_0bd5
    case rpcServiceAlreadyRegistered = 0x0000_0bd6
    case presenceAlreadySubscribed = 0x0000_0fa2
    case presenceTooManySubscriptions = 0x0000_0fa6
    case presenceNoRecord = 0x0000_0fab
    case friendsTooManySentInvitations = 0x0000_1389
    case friendsTooManyReceivedInvitations = 0x0000_138a
    case friendsFriendshipAlreadyExists = 0x0000_138b
    case friendsFriendshipDoesNotExist = 0x0000_138c
    case friendsInvitationAlreadyExists = 0x0000_138d
    case friendsInvalidInvitation = 0x0000_138e
    case friendsAlreadySubscribed = 0x0000_138f
    case friendsAccountBlocked = 0x0000_1391
    case friendsNotSubscribed = 0x0000_1392
    case friendsInvalidRoleId = 0x0000_1393
    case friendsDisabledRoleId = 0x0000_1394
    case friendsNoteMaxSizeExceeded = 0x0000_1395
    case friendsUpdateFriendStateFailed = 0x0000_1396
    case friendsInviteeAtMaxFriends = 0x0000_1397
    case friendsInviterAtMaxFriends = 0x0000_1398
    case friendsInviterIsBlockedByInvitee = 0x0000_1399
    case friendsInviterAtMaxSentInvitations = 0x0000_139a
    case platformStorageFileWriteDenied = 0x0000_1770
    case whisperUndeliverable = 0x0000_1b58
    case whisperMaxSizeExceeded = 0x0000_1b59
    case whisperAlreadyRegistered = 0x0000_1b5a
    case whisperDropped = 0x0000_1b5b
    case whisperQuotaExceeded = 0x0000_1b5c
    case userManagerAlreadyBlocked = 0x0000_1f40
    case userManagerNotBlocked = 0x0000_1f41
    case userManagerCannotBlockSelf = 0x0000_1f42
    case userManagerAlreadyRegistered = 0x0000_1f43
    case userManagerNotRegistered = 0x0000_1f44
    case userManagerTooManyBlockedEntities = 0x0000_1f45
    case userManagerTooManyIds = 0x0000_1f47
    case userManagerBlockRecordUnavailable = 0x0000_1f4f
    case userManagerBlockEntityFailed = 0x0000_1f50
    case userManagerUnblockEntityFailed = 0x0000_1f51
    case userManagerCannotBlockFriend = 0x0000_1f53
    case socialNetworkOauthException = 0x0000_2328
    case socialNetworkInvalidSnsId = 0x0000_2329
    case socialNetworkCantSendToProvider = 0x0000_232a
    case socialNetworkDisabled = 0x0000_232b
    case socialNetworkMissingRequestParam = 0x0000_232c
    case socialNetworkNoAccountData = 0x0000_232d
    case socialNetworkNoToken = 0x0000_232e
    case socialNetworkMissingDataFromProvider = 0x0000_232f
    case socialNetworkResponseNotParsable = 0x0000_2330
    case socialNetworkTokenPermissionDenied = 0x0000_2331
    case socialNetworkDenialFromProvider = 0x0000_2332
    case channelFull = 0x0000_2710
    case channelNoChannel = 0x0000_2711
    case channelNotMember = 0x0000_2712
    case channelAlreadyMember = 0x0000_2713
    case channelNoSuchMember = 0x0000_2714
    case channelNoSuchInvitation = 0x0000_2718
    case channelTooManyInvitations = 0x0000_2719
    case channelInvitationAlreadyExists = 0x0000_271a
    case channelInvalidRoleId = 0x0000_271c
    case channelRoleNotAssignable = 0x0000_271d
    case channelInsufficientPrivileges = 0x0000_271e
    case channelInsufficientPrivacyLevel = 0x0000_271f
    case channelInvalidPrivacyLevel = 0x0000_2720
    case channelTooManyChannelsJoined = 0x0000_2721
    case channelInvalidChannelDelegate = 0x0000_2723
    case channelSlotAlreadyReserved = 0x0000_2724
    case channelNoReservedSlotsAvailable = 0x0000_2726
    case channelInvalidRoleSet = 0x0000_2727
    case channelReceivedTooManyInvitations = 0x0000_272a
    case channelInvitationInvalidGameAccountSelected = 0x0000_272b
    case channelInvitationNotSubscribed = 0x0000_272d
    case channelInvalidChannelType = 0x0000_2731
    case clubFull = 0x0000_2af8
    case clubNoClub = 0x0000_2af9
    case clubNotMember = 0x0000_2afa
    case clubAlreadyMember = 0x0000_2afb
    case clubNoSuchMember = 0x0000_2afc
    case clubNoSuchInvitation = 0x0000_2b00
    case clubInvitationAlreadyExists = 0x0000_2b02
    case clubInvalidRoleId = 0x0000_2b04
    case clubInsufficientPrivileges = 0x0000_2b06
    case clubInsufficientPrivacyLevel = 0x0000_2b07
    case clubInvalidPrivacyLevel = 0x0000_2b08
    case clubTooManyClubsJoined = 0x0000_2b09
    case clubInvalidRoleSet = 0x0000_2b0f
    case clubNotSubscribed = 0x0000_2b15
    case clubAlreadySubscribed = 0x0000_2b16
    case clubInvalidClubType = 0x0000_2b19
    case clubVoiceFull = 0x0000_2b1a
    case clubMemberSubscriptionsAtMax = 0x0000_2b1b
    case clubSuggestionAlreadyExists = 0x0000_2b20
    case clubSuggestionCountAtMax = 0x0000_2b21
    case clubNoSuchSuggestion = 0x0000_2b22
    case clubStreamNoStream = 0x0000_2b5c
    case clubStreamInvalidName = 0x0000_2b5d
    case clubStreamCountAtMin = 0x0000_2b5e
    case clubStreamCountAtMax = 0x0000_2b5f
    case clubStreamInvalidVoiceLevel = 0x0000_2b60
    case clubStreamNoSuchMessage = 0x0000_2b61
    case clubInvalidAvatar = 0x0000_2b75
    case clubMemberHasRequiredRole = 0x0000_2b76
    case clubInvalidRoleChangeRequest = 0x0000_2b77
    case clubSentInvitationCountAtMax = 0x0000_2b8e
    case clubReceivedInvitationCountAtMax = 0x0000_2b8f
    case clubTargetIsBanned = 0x0000_2b90
    case clubNoSuchBannedTarget = 0x0000_2b91
    case clubBanAlreadyExists = 0x0000_2b92
    case clubBanCountAtMax = 0x0000_2b93
    case clubTicketCountAtMax = 0x0000_2ba2
    case clubTicketNoSuchTicket = 0x0000_2ba3
    case clubTicketHasConsumedAllowedRedeemCount = 0x0000_2ba4
    case registryCreateKeyError = 0x0000_2ee0
    case registryOpenKeyError = 0x0000_2ee1
    case registryReadError = 0x0000_2ee2
    case registryWriteError = 0x0000_2ee3
    case registryTypeError = 0x0000_2ee4
    case registryDeleteError = 0x0000_2ee5
    case registryEncryptError = 0x0000_2ee6
    case registryDecryptError = 0x0000_2ee7
    case registryKeySizeError = 0x0000_2ee8
    case registryValueSizeError = 0x0000_2ee9
    case registryNotFound = 0x0000_2eeb
    case registryMalformedString = 0x0000_2eec
    case httpCouldntResolve = 0x0000_36b0
    case httpCouldntConnect = 0x0000_36b1
    case httpTimeout = 0x0000_36b2
    case httpFailed = 0x0000_36b3
    case httpMalformedUrl = 0x0000_36b4
    case httpDownloadAborted = 0x0000_36b5
    case httpCouldntWriteFile = 0x0000_36b6
    case httpTooManyRedirects = 0x0000_36b7
    case httpCouldntOpenFile = 0x0000_36b8
    case httpCouldntCreateFile = 0x0000_36b9
    case httpCouldntReadFile = 0x0000_36ba
    case httpCouldntRenameFile = 0x0000_36bb
    case httpCouldntCreateDirectory = 0x0000_36bc
    case httpCurlIsNotReady = 0x0000_36bd
    case httpCancelled = 0x0000_36be
    case httpFileNotFound = 0x0000_3844
    case asterionGeneralRuntime = 0x0000_3a98
    case asterionShardNotFound = 0x0000_3a9a
    case asterionInvalidParameter = 0x0000_3a9b
    case asterionAccountNotFound = 0x0000_3a9c
    case asterionDeductRecordDuplicated = 0x0000_3a9f
    case asterionDeductRecordMinimumGametime = 0x0000_3aa0
    case asterionDeductRecordInvalidStopTime = 0x0000_3aa1
    case accountMissingConfig = 0x0000_4650
    case accountDataNotFound = 0x0000_4651
    case accountAlreadySubscribed = 0x0000_4652
    case accountNotSubscribed = 0x0000_4653
    case accountFailedToParseTimezoneData = 0x0000_4654
    case accountLoadFailed = 0x0000_4655
    case accountLoadCancelled = 0x0000_4656
    case accountDatabaseInvalidateFailed = 0x0000_4657
    case accountCacheInvalidateFailed = 0x0000_4658
    case accountSubscriptionPending = 0x0000_4659
    case accountUnknownRegion = 0x0000_465a
    case accountDataFailedToParse = 0x0000_465b
    case accountUnderage = 0x0000_465c
    case accountIdentityCheckPending = 0x0000_465d
    case accountIdentityUnverified = 0x0000_465e
    case databaseBindingCountMismatch = 0x0000_4a38
    case databaseBindingParseFail = 0x0000_4a39
    case databaseResultsetColumnsMismatch = 0x0000_4a3a
    case databaseDeadlock = 0x0000_4a3b
    case databaseDuplicateKey = 0x0000_4a3c
    case databaseCannotConnect = 0x0000_4a3d
    case databaseStatementFailed = 0x0000_4a3e
    case databaseTransactionNotStarted = 0x0000_4a3f
    case databaseTransactionNotEnded = 0x0000_4a40
    case databaseTransactionLeak = 0x0000_4a41
    case databaseTransactionStateBad = 0x0000_4a42
    case databaseServerGone = 0x0000_4a43
    case databaseQueryTimeout = 0x0000_4a44
    case databaseNoResultReturned = 0x0000_4a45
    case databaseBindingNotNullable = 0x0000_4a9c
    case databaseBindingInvalidInteger = 0x0000_4a9d
    case databaseBindingInvalidFloat = 0x0000_4a9e
    case databaseBindingInvalidTemporal = 0x0000_4a9f
    case databaseBindingInvalidProtobuf = 0x0000_4aa0
    case gamesNoSuchFactory = 0x0000_55f0
    case gamesNoSuchGame = 0x0000_55f1
    case gamesNoSuchRequest = 0x0000_55f2
    case gamesNoSuchPartyMember = 0x0000_55f3
    case resourcesOffline = 0x0000_59d8
    case gameServerCreateGameRefused = 0x0000_5dc0
    case gameServerAddPlayersRefused = 0x0000_5dc1
    case gameServerRemovePlayersRefused = 0x0000_5dc2
    case gameServerFinishGameRefused = 0x0000_5dc3
    case gameServerNoSuchGame = 0x0000_5dc4
    case gameServerNoSuchPlayer = 0x0000_5dc5
    case gameServerCreateGameRefusedTransient = 0x0000_5df2
    case gameServerAddPlayersRefusedTransient = 0x0000_5df3
    case gameServerRemovePlayersRefusedTransient = 0x0000_5df4
    case gameServerFinishGameRefusedTransient = 0x0000_5df5
    case gameServerCreateGameRefusedBusy = 0x0000_5e24
    case gameServerAddPlayersRefusedBusy = 0x0000_5e25
    case gameServerRemovePlayersRefusedBusy = 0x0000_5e26
    case gameServerFinishGameRefusedBusy = 0x0000_5e27
    case gameMasterInvalidFactory = 0x0000_61a8
    case gameMasterInvalidGame = 0x0000_61a9
    case gameMasterGameFull = 0x0000_61aa
    case gameMasterRegisterFailed = 0x0000_61ab
    case gameMasterNoGameServer = 0x0000_61ac
    case gameMasterNoUtilityServer = 0x0000_61ad
    case gameMasterNoGameVersion = 0x0000_61ae
    case gameMasterGameJoinFailed = 0x0000_61af
    case gameMasterAlreadyRegistered = 0x0000_61b0
    case gameMasterNoFactory = 0x0000_61b1
    case gameMasterMultipleGameVersions = 0x0000_61b2
    case gameMasterInvalidPlayer = 0x0000_61b3
    case gameMasterInvalidGameRequest = 0x0000_61b4
    case gameMasterInsufficientPrivileges = 0x0000_61b5
    case gameMasterAlreadyInGame = 0x0000_61b6
    case gameMasterInvalidGameServerResponse = 0x0000_61b7
    case gameMasterGameAccountLookupFailed = 0x0000_61b8
    case gameMasterGameEntryCancelled = 0x0000_61b9
    case gameMasterGameEntryAbortedClientDropped = 0x0000_61ba
    case gameMasterGameEntryAbortedByService = 0x0000_61bb
    case gameMasterNoAvailableCapacity = 0x0000_61bc
    case gameMasterInvalidTeamId = 0x0000_61bd
    case gameMasterCreationInProgress = 0x0000_61be
    case notificationInvalidClientId = 0x0000_6590
    case notificationDuplicateName = 0x0000_6591
    case notificationNameNotFound = 0x0000_6592
    case notificationInvalidServer = 0x0000_6593
    case notificationQuotaExceeded = 0x0000_6594
    case notificationInvalidNotificationType = 0x0000_6595
    case notificationUndeliverable = 0x0000_6596
    case notificationUndeliverableTemporary = 0x0000_6597
    case achievementsNothingToUpdate = 0x0000_6d60
    case achievementsInvalidParams = 0x0000_6d61
    case achievementsNotRegistered = 0x0000_6d62
    case achievementsNotReady = 0x0000_6d63
    case achievementsFailedToParseStaticData = 0x0000_6d64
    case achievementsUnknownId = 0x0000_6d65
    case achievementsMissingSnapshot = 0x0000_6d66
    case achievementsAlreadyRegistered = 0x0000_6d67
    case achievementsTooManyRegistrations = 0x0000_6d68
    case achievementsAlreadyInProgress = 0x0000_6d69
    case achievementsTemporaryOutage = 0x0000_6d6a
    case achievementsInvalidProgramid = 0x0000_6d6b
    case achievementsMissingRecord = 0x0000_6d6c
    case achievementsRegistrationPending = 0x0000_6d6d
    case achievementsEntityIdNotFound = 0x0000_6d6e
    case achievementsAchievementIdNotFound = 0x0000_6d6f
    case achievementsCriteriaIdNotFound = 0x0000_6d70
    case achievementsStaticDataMismatch = 0x0000_6d71
    case achievementsWrongThread = 0x0000_6d72
    case achievementsCallbackIsNull = 0x0000_6d73
    case achievementsAutoRegisterPending = 0x0000_6d74
    case achievementsNotInitialized = 0x0000_6d75
    case achievementsAchievementIdAlreadyExists = 0x0000_6d76
    case achievementsFailedToDownloadStaticData = 0x0000_6d77
    case achievementsStaticDataNotFound = 0x0000_6d78
    case matchmakingMatchmakerNotFound = 0x0000_7530
    case matchmaking_30001 = 0x0000_7531
    case matchmakingGameserverNotFound = 0x0000_7532
    case matchmaking_30003 = 0x0000_7533
    case matchmakingMatchmakerAlreadyRegistered = 0x0000_7534
    case matchmakingGameserverAlreadyRegistered = 0x0000_7535
    case matchmakingRequestIdNotFound = 0x0000_7536
    case matchmakingInsufficientPartyPrivileges = 0x0000_7537
    case matchmakingEventQueueFull = 0x0000_7538
    case matchmakingCancelNotAllowed = 0x0000_7539
    case matchmakingPlayerNotConnected = 0x0000_753a
    case matchmakingEventCanceled = 0x0000_753b
    case matchmakingGameserverFull = 0x0000_753c
    case matchmakingInvalidResponse = 0x0000_753d
    case matchmakingServerAlreadyInGame = 0x0000_7918
    case matchmakingServerInvalidGame = 0x0000_7919
    case matchmakingServerInvalidPlayer = 0x0000_791a
    case matchmakingServerGameFull = 0x0000_791b
    case matchmakingServerUnknownRequestId = 0x0000_791c
    case gameUtilityServerVariableRequestRefused = 0x0000_84d1
    case gameUtilityServerWrongNumberOfVariablesReturned = 0x0000_84d2
    case gameUtilityServerClientRequestRefused = 0x0000_84d3
    case gameUtilityServerPresenceChannelCreatedRefused = 0x0000_84d4
    case gameUtilityServerVariableRequestRefusedTransient = 0x0000_8502
    case gameUtilityServerClientRequestRefusedTransient = 0x0000_8503
    case gameUtilityServerPresenceChannelCreatedRefusedTransient = 0x0000_8504
    case gameUtilityServerServerRequestRefusedTransient = 0x0000_8505
    case gameUtilityServerVariableRequestRefusedBusy = 0x0000_8534
    case gameUtilityServerClientRequestRefusedBusy = 0x0000_8535
    case gameUtilityServerPresenceChannelCreatedRefusedBusy = 0x0000_8536
    case gameUtilityServerServerRequestRefusedBusy = 0x0000_8537
    case gameUtilityServerNoServer = 0x0000_8598
    case sessionCreateFailed = 0x0000_9c40
    case sessionTickFailed = 0x0000_9c41
    case sessionGameAccountBadStatus = 0x0000_9c42
    case sessionSponsorNotFound = 0x0000_9c43
    case sessionAdminKick = 0x0000_9c44
    case sessionInvalidSponsor = 0x0000_9c45
    case sessionKick = 0x0000_9c46
    case sessionBenefactorNotFound = 0x0000_9c47
    case sessionAbandoned = 0x0000_9c48
    case sessionStorageInsertFailed = 0x0000_9ca4
    case sessionStorageDeleteFailed = 0x0000_9ca5
    case sessionStorageUpdateFailed = 0x0000_9ca6
    case sessionStorageSelectFailed = 0x0000_9ca7
    case sessionStorageUpdateDeductPendingFailed = 0x0000_9ca8
    case riskThrottleAction = 0x0000_a412
    case riskAccountLocked = 0x0000_a413
    case riskDisconnectAccount = 0x0000_a415
    case riskCheckSkipped = 0x0000_a416
    case reportUnavailable = 0x0000_afc8
    case reportUnknownType = 0x0000_afca
    case reportAttributeQuotaExceeded = 0x0000_afcc
    case reportUnconfirmed = 0x0000_afcd
    case memcachedClientNoError = 0x0001_0000
    case memcachedClientKeyNotFound = 0x0001_0001
    case memcachedKeyExists = 0x0001_0002
    case memcachedValueToLarge = 0x0001_0003
    case memcachedInvalidArgs = 0x0001_0004
    case memcachedItemNotStored = 0x0001_0005
    case memcachedNonNumericValue = 0x0001_0006
    case memcachedWrongServer = 0x0001_0007
    case memcachedAuthenticationError = 0x0001_0008
    case memcachedAuthenticationContinue = 0x0001_0009
    case memcachedUnknownCommand = 0x0001_000a
    case memcachedOutOfMemory = 0x0001_000b
    case memcachedNotSupported = 0x0001_000c
    case memcachedInternalError = 0x0001_000d
    case memcachedTemporaryFailure = 0x0001_000e
    case memcachedClientAlreadyConnected = 0x0001_86a0
    case memcachedClientBadConfig = 0x0001_86a1
    case memcachedClientNotConnected = 0x0001_86a2
    case memcachedClientTimeout = 0x0001_86a3
    case memcachedClientAborted = 0x0001_86a4
    case utilServerFailedToSerialize = 0x8000_0064
    case utilServerDisconnectedFromBattlenet = 0x8000_0065
    case utilServerTimedOut = 0x8000_0066
    case utilServerNoMeteringData = 0x8000_0067
    case utilServerFailPermissionCheck = 0x8000_0068
    case utilServerUnknownRealm = 0x8000_0069
    case utilServerMissingSessionKey = 0x8000_006a
    case utilServerMissingVirtualRealm = 0x8000_006b
    case utilServerInvalidSessionKey = 0x8000_006c
    case utilServerMissingRealmList = 0x8000_006d
    case utilServerInvalidIdentityArgs = 0x8000_006e
    case utilServerSessionObjectMissing = 0x8000_006f
    case utilServerInvalidBnetSession = 0x8000_0070
    case utilServerInvalidVirtualRealm = 0x8000_0071
    case utilServerInvalidClientAddress = 0x8000_0072
    case utilServerFailedToSerializeResponse = 0x8000_0073
    case utilServerUnknownRequest = 0x8000_0074
    case utilServerUnableToGenerateJoinTicket = 0x8000_0075
    case utilServerUnableToGenerateRealmListTicket = 0x8000_0076
    case utilServerAccountDenied = 0x8000_0077
    case utilServerInvalidWowAccount = 0x8000_0078
    case utilServerUnableToStoreSession = 0x8000_0079
    case utilServerSessionAlreadyCreated = 0x8000_007a
    case utilServerUnableToGetWowAccount = 0x8000_007b
    case utilServerUnableToCreateVoiceChannelUniqueName = 0x8000_007c
    case utilServerVoiceDisabled = 0x8000_007d
    case utilServerLegacyMobileUnsupported = 0x8000_007e
    case userServerFailedToSerialize = 0x8000_00c8
    case userServerDisconnectedFromUtil = 0x8000_00c9
    case userServerSessionDuplicate = 0x8000_00ca
    case userServerFailedToDisableBilling = 0x8000_00cb
    case userServerPlayerDisconnected = 0x8000_00cc
    case userServerFailedToParseAccountState = 0x8000_00cd
    case userServerAccountLoadCancelled = 0x8000_00ce
    case userServerBadPlatform = 0x8000_00cf
    case userServerBadVirtualRealm = 0x8000_00d0
    case userServerLocaleRestricted = 0x8000_00d1
    case userServerMissingPropass = 0x8000_00d2
    case userServerBadWowAccount = 0x8000_00d3
    case userServerBadBnetAccount = 0x8000_00d4
    case userServerFailedToParseGameAccountState = 0x8000_00d5
    case userServerFailedToParseGameTimeRemaining = 0x8000_00d6
    case userServerFailedToParseGameSessionInfo = 0x8000_00d7
    case userServerAccountStatePoorlyFormed = 0x8000_00d8
    case userServerGameAccountStatePoorlyFormed = 0x8000_00d9
    case userServerGameTimeRemainingPoorlyFormed = 0x8000_00da
    case userServerGameSessionInfoPoorlyFormed = 0x8000_00db
    case userServerBadSessionTrackerState = 0x8000_00dc
    case userServerFailedToParseCaisInfo = 0x8000_00dd
    case userServerGameSessionDisconnected = 0x8000_00de
    case userServerVersionMismatch = 0x8000_00df
    case userServerAccountSuspended = 0x8000_00e0
    case userServerNotPermittedOnRealm = 0x8000_00e1
    case userServerLoginFailedConnect = 0x8000_00e2
    case userServerLoginTicketNotInitialized = 0x8000_00e3
    case userServerMobileTrialNotAllowed = 0x8000_00e4
    case userServerMobileConsumptionTimeNotAllowed = 0x8000_00e5
    case userServerMobileLoginDisabled = 0x8000_00e6
    case userServerMobileFailedClientCreate = 0x8000_00e7
    case userServerMobileWorldLoginFailed = 0x8000_00e8
    case userServerMobileCharacterStillInWorld = 0x8000_00e9
    case userServerInvalidArgs = 0x8000_00ea
    case userServerGameAsterionStatePoorlyFormed = 0x8000_00eb
    case userServerRequiresSubscription = 0x8000_00ec
    case userServerVoiceChatFailure = 0x8000_00ed
    case userServerUserRouterTransfer = 0x8000_00ee
    case wowServicesTimedOut = 0x8000_012c
    case wowServicesInvalidRealmListTicket = 0x8000_012d
    case wowServicesInvalidJoinTicket = 0x8000_012e
    case wowServicesInvalidServerAddresses = 0x8000_012f
    case wowServicesInvalidSecretBlob = 0x8000_0130
    case wowServicesNoRealmJoinIpFound = 0x8000_0131
    case wowServicesDeniedRealmListTicket = 0x8000_0132
    case wowServicesMissingGameAccount = 0x8000_0133
    case wowServicesLogonInvalidAuthToken = 0x8000_0134
    case wowServicesNoAvailableRealms = 0x8000_0135
    case wowServicesFailedToParseDispatch = 0x8000_0136
    case wowServicesMissingMeteringFile = 0x8000_0137
    case wowServicesLoginInvalidContentType = 0x8000_0138
    case wowServicesLoginUnableToDecode = 0x8000_0139
    case wowServicesLoginPostError = 0x8000_013a
    case wowServicesAuthenticatorParseFailed = 0x8000_013b
    case wowServicesLegalParseFailed = 0x8000_013c
    case wowServicesLoginAuthenticationParseFailed = 0x8000_013d
    case wowSerivcesUserMustAcceptLegal = 0x8000_013e
    case wowServicesDisconnected = 0x8000_013f
    case wowServicesNoHandlerForDispatch = 0x8000_0140
    case wowServicesPreDispatchHandlerFailed = 0x8000_0141
    case wowServicesCriticalStreamingError = 0x8000_0142
    case wowServicesWorldLoadError = 0x8000_0143
    case wowServicesLoginFailed = 0x8000_0144
    case wowServicesLoginFailedOnChallenge = 0x8000_0145
    case wowServicesNoPrepaidTime = 0x8000_0146
    case wowServicesSubscriptionExpired = 0x8000_0147
    case wowServicesCantConnect = 0x8000_0148
    case wowServicesNoFrontOrBackConnection = 0x8000_0149
    case wowServicesBadBasicLoginInfo = 0x8000_014a
}