import gleam/dict.{type Dict}
import gleam/option.{type Option}

pub type ApiKey =
  String

pub opaque type StripeClient {
  StripeClient(api_key: ApiKey)
}

pub fn new(api_key: ApiKey) -> StripeClient {
  StripeClient(api_key)
}

pub type Address {
  Address(
    city: Option(String),
    country: Option(String),
    line1: Option(String),
    line2: Option(String),
    postal_cose: Option(String),
    state: Option(String),
  )
}

pub type InvoiceSettings {
  InvoiceSettings(
    custom_fields: Option(List(CustomField)),
    default_payment_method: Option(String),
    footer: Option(String),
    rendering_options: Option(RenderingOptions),
  )
}

pub type CustomField {
  CustomField(name: String, value: String)
}

pub type RenderingOptions {
  RenderingOptions
}

pub type Shipping {
  Shipping(address: Address, name: String, phone: Option(String))
}

pub type CashBalanceSettings {
  CashBalanceSettings(
    reconciliation_mode: ReconiliationMode,
    using_merchant_default: Bool,
  )
}

pub type CashBalance {
  CashBalance(
    object: String,
    available: Option(String),
    customer: String,
    livemode: Bool,
    settings: CashBalanceSettings,
  )
}

pub type ReconiliationMode {
  Automatic
  Manual
}

pub type CouponAppliesTo {
  List(String)
}

pub type CurrencyOption {
  CurrencyOption(amount_off: Int)
}

pub type Duration {
  Forever
  Once
  Repeating
}

pub type Timestamp {
  Int
}

pub type Coupon {
  Coupon(
    id: String,
    object: String,
    amount_off: Option(Int),
    applies_to: Option(CouponAppliesTo),
    created: Timestamp,
    currency: Option(Currency),
    currency_options: Option(Dict(Currency, CurrencyOption)),
    duration: Duration,
    duration_in_months: Option(Int),
    livemode: Bool,
    max_redemptions: Option(Int),
    metadata: Option(Dict(String, String)),
    name: Option(String),
    percent_off: Option(Float),
    redeem_by: Option(Timestamp),
    times_redeemed: Int,
    valid: Bool,
  )
}

pub type Discount {
  Discount(
    id: String,
    object: String,
    checkout_session: Option(String),
    coupon: Coupon,
    customer: Option(String),
    end: Option(Timestamp),
    invoice: Option(String),
    invoice_item: Option(String),
    promotion_code: Option(String),
    start: Timestamp,
    subscription: Option(String),
    subscription_item: Option(String),
  )
}

pub type PayoutMethod {
  Instant
  Standard
}

pub type Source {
  Source(
    id: String,
    object: String,
    account: Option(String),
    account_holder_name: Option(String),
    account_holder_type: Option(String),
    account_type: Option(String),
    available_payout_methods: Option(List(PayoutMethod)),
    bank_name: Option(String),
    country: String,
    currency: Currency,
    customer: Option(String),
    fingerprint: Option(String),
    last4: String,
    metadata: Option(Dict(String, String)),
    routing_number: Option(String),
    status: String,
    has_more: Bool,
    url: String,
  )
}

pub type Sources {
  Sources(object: String, data: List(Source), has_more: Bool, url: String)
}

pub type AutomaticTax {
  Failed
  NotCollecting
  Supported
  UnrecognizedLocation
}

pub type Location {
  Location(
    country: String,
    // TODO: Source should be enum
    source: String,
    state: Option(String),
  )
}

pub type Tax {
  Tax(
    automatic_tax: Option(AutomaticTax),
    ip_address: Option(String),
    location: Option(Location),
  )
}

pub type TaxExempt {
  Exempt
  None
  Reverse
}

pub type TaxIdOwnerType {
  Account
  Application
  CustomerType
  Self
}

pub type TaxIdType {
  AdNrt
  AeTrn
  ArCuit
  AuAbn
  AuArn
  BgUic
  BhVat
  BoTin
  BrCnpj
  BrCpf
  CaBn
  CaGstHst
  CaPstBc
  CaPstMb
  CaPstSk
  CaQst
  ChVat
  ClTin
  CnTin
  CoNit
  CrTin
  DoRcn
  EcRuc
  EgTin
  EsCif
  EuOssVat
  EuVat
  GbVat
  GeVat
  HkBr
  HuTin
  IdNpwp
  IlVat
  InGst
  IsVat
  JpCn
  JpRn
  JpTrn
  KePin
  KrBrn
  KzBin
  LiUid
  MxRfc
  MyFrp
  MyItn
  MySst
  NgTin
  NoVat
  NoVoec
  NzGst
  OmVat
  PeRuc
  PhTin
  RoTin
  RsPib
  RuInn
  RuKpp
  SaVat
  SgGst
  SgUen
  SiTin
  SvNit
  ThVat
  TrTin
  TwVat
  UaVat
  UsEin
  UyRuc
  VeRif
  VnTin
  ZaVat
  Unknown
  // For legacy tax IDs with type unknown
}

pub type TaxIdOwner {
  Owner(
    account: Option(String),
    application: Option(String),
    customer: Option(String),
    type_: TaxIdOwnerType,
  )
}

pub type TaxIdVerification {
  TaxIdVerification(
    status: TaxIdVerificationStatus,
    verified_address: Option(String),
    verified_name: Option(String),
  )
}

pub type TaxIdVerificationStatus {
  Pending
  Unavailable
  Unverified
  Verified
}

pub type TaxId {
  TaxId(
    id: String,
    object: String,
    country: Option(String),
    created: Timestamp,
    customer: Option(String),
    livemode: Bool,
    owner: Option(TaxIdOwner),
    type_: TaxIdType,
    value: String,
    verification: Option(TaxIdVerification),
  )
}

pub type TaxIds {
  TaxIds(object: String, data: List(TaxId), has_more: Bool, url: String)
}

pub type Customer {
  Customer(
    id: String,
    object: String,
    address: Option(Address),
    balance: Int,
    cash_balance: Option(CashBalance),
    created: Int,
    currency: Option(String),
    default_source: Option(String),
    delinquent: Bool,
    description: Option(String),
    discount: Option(Discount),
    email: Option(String),
    invoice_prefix: Option(String),
    invoice_settings: Option(InvoiceSettings),
    livemode: Bool,
    // TODO: metadata more generic?
    metadata: Option(Dict(String, String)),
    name: Option(String),
    next_invoice_sequence: Option(Int),
    phone: Option(String),
    preferred_locales: Option(List(String)),
    shipping: Option(Shipping),
    sources: Option(Sources),
    tax: Tax,
    tax_exempt: Option(TaxExempt),
    tax_ids: Option(TaxIds),
    test_clock: Option(String),
  )
}

pub type Currency {
  USD
  AED
  AFN
  ALL
  AMD
  ANG
  AOA
  ARS
  AUD
  AWG
  AZN
  BAM
  BBD
  BDT
  BGN
  BIF
  BMD
  BND
  BOB
  BRL
  BSD
  BWP
  BYN
  BZD
  CAD
  CDF
  CHF
  CLP
  CNY
  COP
  CRC
  CVE
  CZK
  DJF
  DKK
  DOP
  DZD
  EGP
  ETB
  EUR
  FJD
  FKP
  GBP
  GEL
  GIP
  GMD
  GNF
  GTQ
  GYD
  HKD
  HNL
  HTG
  HUF
  IDR
  ILS
  INR
  ISK
  JMD
  JPY
  KES
  KGS
  KHR
  KMF
  KRW
  KYD
  KZT
  LAK
  LBP
  LKR
  LRD
  LSL
  MAD
  MDL
  MGA
  MKD
  MMK
  MNT
  MOP
  MUR
  MVR
  MWK
  MXN
  MYR
  MZN
  NAD
  NGN
  NIO
  NOK
  NPR
  NZD
  PAB
  PEN
  PGK
  PHP
  PKR
  PLN
  PYG
  QAR
  RON
  RSD
  RUB
  RWF
  SAR
  SBD
  SCR
  SEK
  SGD
  SHP
  SLE
  SOS
  SRD
  STD
  SZL
  THB
  TJS
  TOP
  TRY
  TTD
  TWD
  TZS
  UAH
  UGX
  UYU
  UZS
  VND
  VUV
  WST
  XAF
  XCD
  XOF
  XPF
  YER
  ZAR
  ZMW
  // Three-decimal currencies
  BHD
  JOD
  KWD
  OMR
  TND
}

pub type CreateCustomerTaxIdData {
  CreateCustomerTypeIdData(data: List(TaxIdType), value: String)
}

pub type CreateCustomerRequest {
  CreateCustomerRequest(
    address: Option(Address),
    clock: Option(String),
    description: Option(String),
    email: Option(String),
    metadata: Option(Dict(String, String)),
    name: Option(String),
    phone: Option(String),
    shipping: Option(Shipping),
    tax_id_data: Option(CreateCustomerTaxIdData),
    test_clock: Option(String),
  )
}

pub fn create_customer(
  client: StripeClient,
  req: CreateCustomerRequest,
) -> Result(Customer, StripeError) {
  let url = client.base_url <> "customers"
}

pub type StripeError {
  AccountClosed
  AccountCountryInvalidAddress
  AccountErrorCountryChangeRequiresAdditionalSteps
  AccountInformationMismatch
  AccountInvalid
  AccountNumberInvalid
  AcssDebitSessionIncomplete
  AlipayUpgradeRequired
  AmountTooLarge
  AmountTooSmall
  ApiKeyExpired
  ApplicationFeesNotAllowed
  AuthenticationRequired
  BalanceInsufficient
  BalanceInvalidParameter
  BankAccountBadRoutingNumbers
  BankAccountDeclined
  BankAccountExists
  BankAccountRestricted
  BankAccountUnusable
  BankAccountUnverified
  BankAccountVerificationFailed
  BillingInvalidMandate
  BillingPolicyRemoteFunctionResponseInvalid
  BillingPolicyRemoteFunctionTimeout
  BillingPolicyRemoteFunctionUnexpectedStatusCode
  BillingPolicyRemoteFunctionUnreachable
  BitcoinUpgradeRequired
  CaptureChargeAuthorizationExpired
  CaptureUnauthorizedPayment
  CardDeclineRateLimitExceeded
  CardDeclined
  CardholderPhoneNumberRequired
  ChargeAlreadyCaptured
  ChargeAlreadyRefunded
  ChargeDisputed
  ChargeExceedsSourceLimit
  ChargeExpiredForCapture
  ChargeInvalidParameter
  ChargeNotRefundable
  ClearingCodeUnsupported
  CountryCodeInvalid
  CountryUnsupported
  CouponExpired
  CustomerMaxPaymentMethods
  CustomerMaxSubscriptions
  CustomerTaxLocationInvalid
  DebitNotAuthorized
  EmailInvalid
  ExpiredCard
  FinancialConnectionsAccountInactive
  FinancialConnectionsNoSuccessfulTransactionRefresh
  ForwardingApiInactive
  ForwardingApiInvalidParameter
  ForwardingApiUpstreamConnectionError
  ForwardingApiUpstreamConnectionTimeout
  IdempotencyKeyInUse
  IncorrectAddress
  IncorrectCvc
  IncorrectNumber
  IncorrectZip
  InstantPayoutsConfigDisabled
  InstantPayoutsCurrencyDisabled
  InstantPayoutsLimitExceeded
  InstantPayoutsUnsupported
  InsufficientFunds
  IntentInvalidState
  IntentVerificationMethodMissing
  InvalidCardType
  InvalidCharacters
  InvalidChargeAmount
  InvalidCvc
  InvalidExpiryMonth
  InvalidExpiryYear
  InvalidNumber
  InvalidSourceUsage
  InvalidTaxLocation
  InvoiceNoCustomerLineItems
  InvoiceNoPaymentMethodTypes
  InvoiceNoSubscriptionLineItems
  InvoiceNotEditable
  InvoiceOnBehalfOfNotEditable
  InvoicePaymentIntentRequiresAction
  InvoiceUpcomingNone
  LivemodeMismatch
  LockTimeout
  Missing
  NoAccount
  NotAllowedOnStandardAccount
  OutOfInventory
  OwnershipDeclarationNotAllowed
  ParameterInvalidEmpty
  ParameterInvalidInteger
  ParameterInvalidStringBlank
  ParameterInvalidStringEmpty
  ParameterMissing
  ParameterUnknown
  ParametersExclusive
  PaymentIntentActionRequired
  PaymentIntentAuthenticationFailure
  PaymentIntentIncompatiblePaymentMethod
  PaymentIntentInvalidParameter
  PaymentIntentKonbiniRejectedConfirmationNumber
  PaymentIntentMandateInvalid
  PaymentIntentPaymentAttemptExpired
  PaymentIntentPaymentAttemptFailed
  PaymentIntentUnexpectedState
  PaymentMethodBankAccountAlreadyVerified
  PaymentMethodBankAccountBlocked
  PaymentMethodBillingDetailsAddressMissing
  PaymentMethodConfigurationFailures
  PaymentMethodCurrencyMismatch
  PaymentMethodCustomerDecline
  PaymentMethodInvalidParameter
  PaymentMethodInvalidParameterTestmode
  PaymentMethodMicrodepositFailed
  PaymentMethodMicrodepositVerificationAmountsInvalid
  PaymentMethodMicrodepositVerificationAmountsMismatch
  PaymentMethodMicrodepositVerificationAttemptsExceeded
  PaymentMethodMicrodepositVerificationDescriptorCodeMismatch
  PaymentMethodMicrodepositVerificationTimeout
  PaymentMethodNotAvailable
  PaymentMethodProviderDecline
  PaymentMethodProviderTimeout
  PaymentMethodUnactivated
  PaymentMethodUnexpectedState
  PaymentMethodUnsupportedType
  PayoutReconciliationNotReady
  PayoutsLimitExceeded
  PayoutsNotAllowed
  PlatformAccountRequired
  PlatformApiKeyExpired
  PostalCodeInvalid
  ProcessingError
  ProductInactive
  ProgressiveOnboardingLimitExceeded
  RateLimit
  ReferToCustomer
  RefundDisputedPayment
  ResourceAlreadyExists
  ResourceMissing
  ReturnIntentAlreadyProcessed
  RoutingNumberInvalid
  SecretKeyRequired
  SepaUnsupportedAccount
  SetupAttemptFailed
  SetupIntentAuthenticationFailure
  SetupIntentInvalidParameter
  SetupIntentMandateInvalid
  SetupIntentSetupAttemptExpired
  SetupIntentUnexpectedState
  ShippingAddressInvalid
  ShippingCalculationFailed
  SkuInactive
  StateUnsupported
  StatusTransitionInvalid
  StripeTaxInactive
  TaxIdInvalid
  TaxesCalculationFailed
  TerminalLocationCountryUnsupported
  TerminalReaderBusy
  TerminalReaderHardwareFault
  TerminalReaderOffline
  TerminalReaderTimeout
  TestmodeChargesOnly
  TlsVersionUnsupported
  TokenAlreadyUsed
  TokenCardNetworkInvalid
  TokenInUse
  TransferSourceBalanceParametersMismatch
  TransfersNotAllowed
  UrlInvalid
}
