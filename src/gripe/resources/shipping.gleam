import gleam/option.{type Option}

import gripe/resources/address.{type Address}

pub type Shipping {
  Shipping(
    address: Option(Address),
    carrier: Option(String),
    name: Option(String),
    phone: Option(String),
    tracking_number: Option(String),
  )
}
