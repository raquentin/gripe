import gleam/dict.{type Dict}

// Not importing None value as it conflicts with TaxExempt variant [`None`].
import gleam/option.{type Option, Some}

import gripe/resources/address.{type Address}
import gripe/resources/cash_balance.{type CashBalance}
import gripe/resources/currency.{type Currency}
import gripe/resources/payment_source.{type PaymentSource}
import gripe/resources/tax_id.{type TaxId}
import gripe/resources/test_clock.{type TestClock}
import gripe/utils/expandable.{type Expandable}

pub opaque type Customer {
  Customer(
    // TODO: what is Radar...CustomerId
    id: CusotmerId,
    address: Option(Address),
    balance: Option(Int),
    cash_balance: Option(CashBalance),
    created: Option(Timestamp),
    currency: Option(Currency),
    default_source: Option(Expandable(PaymentSource)),
    delinquent: Bool,
    description: Option(String),
    discount: Option(Discount),
    email: Option(String),
    invoice_credit_balance: Option(Int),
    invoice_prefix: Option(String),
    invoice_settings: Option(CustomerInvoiceSettings),
    livemode: Option(Bool),
    metadata: Option(Dict(String, String)),
    name: Option(String),
    next_invoice_sequence: Option(Int),
    phone: Option(String),
    preferred_locales: Option(List(String)),
    shipping: Option(Shipping),
    sources: List(PaymentSource),
    tax: Option(CustomerTax),
    tax_exempt: Option(CustomerTaxExempt),
    tax_ids: Option(List(TaxId)),
    test_clock: Option(Expandable(TestClock)),
  )
}

pub type CustomerInvoiceSettings {
  CustomerInvoiceSettings(
    custom_fields: Option(List(CustomerInvoiceSettingsCustomField)),
    default_payment_method: Option(Expandable(PaymentMethod)),
    footer: Option(String),
    rendering_options: Option(CustomerInvoiceSettingsRenderingOptions),
  )
}

pub type CustomerInvoiceSettingsCustomField {
  CustomerInvoiceSettingsCustomField(name: String, value: String)
}

pub type CustomeInvoiceSettingsRenderingOptions {
  CustomerInvoiceSettingsRenderingOptions(amount_tax_display: Option(String))
}

pub type CustomerTax {
  CustomerTax(
    automatic_tax: CustomerTaxAutomaticTax,
    ip_address: Option(String),
    location: Option(CustomerTaxLocation),
  )
}

pub type CustomerTaxAutomaticTax {
  Failed
  NotCollecting
  Supported
  UnrecognizedLocation
}

pub type CustomerTaxLocation {
  Location(
    country: String,
    source: CustomerTaxLocationSource,
    state: Option(String),
  )
}

pub type CustomerTaxLocationSource {
  BillingAddress
  IpAddress
  PaymentMethod
  ShippingDestination
}

pub type CustomerTaxExempt {
  Exempt
  None
  Reverse
}
