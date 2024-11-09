import gleam/option.{type Option}

import gripe/ids

pub type PromotionCode {
  PromotionCode(
    id: ids.PromotionCodeId,
    active: Bool,
    code: String,
    coupon: Coupon,
    created: Timestamp,
    customer: Option(Expandable(Customer)),
    expires_at: Option(Timestamp),
    livemode: Bool,
    max_redemptions: Option(Int),
    metadata: Option(Dict(String, String)),
    restrictions: PromotionCodeRestrictions,
    times_redeemed: Int,
  )
}

pub type PromotionCodeRestriction {
  PromotionCodeRestriction(
    currency_options: Option(Dict(Currency, PromotionCodeCurrencyOption)),
    first_time_transaction: Bool,
    minimum_amount: Int,
    // TODO: put the default here in a doc comment, usd or location-specific
    minimum_amount_currency: Option(Currency),
  )
}
