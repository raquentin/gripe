//// All implementations as per https://stripe.com/docs/api.

import gleam/option.{type Option, None, Some}
import gleam/uri.{type Uri}
import gleeunit/should

/// A type encapsulating static Stripe request metadata.
pub opaque type StripeContext {
  StripeContext(
    api_key: String,
    base_url: Uri,
    idempotency_key: Option(String),
    connected_account: Option(String),
  )
}

/// Create a context for future Stripe API requests.
pub fn new_client(api_key: String) -> StripeContext {
  let default_base_url =
    uri.parse("https://api.stripe.com/v1")
    |> should.be_ok

  StripeContext(
    api_key: api_key,
    base_url: default_base_url,
    idempotency_key: None,
    connected_account: None,
  )
}

/// Supply a custom base URL.
pub fn with_base_url(context: StripeContext, base_url: Uri) -> StripeContext {
  StripeContext(..context, base_url: base_url)
}

/// Supply an idempotency key to safely retry requests without accidentally performing the same operation twice.
/// See https://docs.stripe.com/api/idempotent_requests.
pub fn with_idempotency_key(
  context: StripeContext,
  idempotency_key: String,
) -> StripeContext {
  StripeContext(..context, idempotency_key: Some(idempotency_key))
}

/// Allow the client to act as a connected account.
/// See https://docs.stripe.com/api/connected-accounts.
pub fn with_connected_account(
  context: StripeContext,
  connected_account: String,
) -> StripeContext {
  StripeContext(..context, connected_account: Some(connected_account))
}
