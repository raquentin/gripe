import gleam/dict.{type Dict}
import gleam/option.{type Option}

import gripe/ids
import gripe/resources/currency.{type Currency}
import gripe/resources/timestamp.{type Timestamp}

pub type Coupon {
  Coupon(
    id: ids.CouponId,
    amount_off: Option(Int),
    applies_to: Option(CouponAppliesTo),
    created: Option(Timestamp),
    currency: Option(Currency),
    currency_options: Option(Dict(Currency, CouponCurrencyOption)),
    deleted: Bool,
    duration: Option(CouponDuration),
    duration_in_months: Option(Int),
    livemode: Option(Bool),
    max_redemptions: Option(Int),
    metadata: Option(Dict(String, String)),
    name: Option(String),
    percent_off: Option(Float),
    redeem_by: Option(Timestamp),
    times_redeemed: Option(Int),
    valid: Option(Bool),
  )
}

pub type CouponAppliesTo {
  CouponAppliesTo(products: List(String))
}

pub type CouponCurrencyOption {
  CouponCurrencyOption(amount_off: Int)
}

pub type CouponDuration {
  Forever
  Once
  Repeating
}
