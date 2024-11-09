import gripe/resources/account.{type Account}
import gripe/resources/bank_account.{type BankAccount}
import gripe/resources/card.{type Card}
import gripe/resources/source.{type Source}

pub type PaymentSource {
  PaymentSource(Card, Source, Account, BankAccount)
}
