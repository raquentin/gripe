import gleam/option.{type Option}

import gripe/ids
import gripe/resources/timestamp.{type Timestamp}

// TODO: make all these types
pub type Source {
  Source(
    id: ids.SourceId,
    ach_credit_transfer: Option(SourceAchCreditTransfer),
    ach_debit: Option(SourceAchDebit),
    acss_debit: Option(SourceAcssDebit),
    alipay: Option(SourceAlipay),
    amount: Option(Int),
    au_becs_debit: Option(Source),
    bancontact: Option(SourceBancontact),
    card: Option(SourceCard),
    card_present: Option(SourceCardPresent),
    client_secret: String,
    code_verification: Option(SourceCodeVerificationFlow),
    created: Timestamp,
    currency: Option(String),
    customer: Option(String),
    eps: Option(SourceEps),
    flow: SourceFlow,
    giropay: Option(SourceGiropay),
    ideal: Option(SourceIdeal),
    klarna: Option(SourceKlarna),
    livemode: Bool,
    metadata: Option(Map(String, String)),
    multibanco: Option(SourceMultibanco),
    owner: Option(SourceOwner),
    p24: Option(SourceP24),
    receiver: Option(SourceReceiverFlow),
    redirect: Option(SourceRedirectFlow),
    sepa_credit_transfer: Option(SourceSepaCreditTransfer),
    sepa_debit: Option(SourceSepaDebit),
    sofort: Option(SourceSofort),
    source_order: Option(SourceOrder),
    statement_descriptor: Option(String),
    status: SourceStatus,
    three_d_secure: Option(SourceThreeDSecure),
    type_: SourceType,
    usage: Option(SourceUsage),
    wechat: Option(SourceWechat),
  )
}
