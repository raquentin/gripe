import gleam/option.{type Option}

pub type CashBalance {
  CashBalance(
    available: Option(Int),
    customer: String,
    livemode: Bool,
    settings: CashBalanceSettings,
  )
}

pub type CashBalanceSettings {
  CashBalanceSettings(
    reconciliation_mode: ReconiliationMode,
    using_merchant_default: Bool,
  )
}

pub type ReconiliationMode {
  Automatic
  Manual
}
