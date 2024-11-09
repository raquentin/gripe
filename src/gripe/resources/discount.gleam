import gleam/option.{type Option}

import gripe/ids
import gripe/resources/customer.{type Customer}
import gripe/resources/timestamp.{type Timestamp}
import gripe/utils/expandable.{type Expandable}

pub type Discount {
  Discount(
    id: ids.DiscountId,
    checkout_session: Option(String),
    coupon: Coupon,
    customer: Option(Expandable(Customer)),
    deleted: Bool,
    end: Option(Timestamp),
    invoice: Option(String),
    invoice_item: Option(String),
    promotion_code: Option(Expandable(PromotionCode)),
    start: Timestamp,
    subscription: Option(String),
  )
}
