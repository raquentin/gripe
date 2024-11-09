import gleam/option.{type Option}

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
