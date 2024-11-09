import gleam/option.{type Option}

import gripe/resources/account.{type Account}
import gripe/utils/expandable.{type Expandable}

pub type Card {
  Card(account: Option(Expandable(Account)))
}
