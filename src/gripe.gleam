//// All implementations as per https://stripe.com/docs/api.

import gleam/uri.{type Uri}

pub type ApiKey =
  String

pub opaque type StripeClient {
  StripeClient(api_key: ApiKey, base_url: Uri)
}

pub fn new(api_key: ApiKey, base_url: Uri) -> StripeClient {
  StripeClient(api_key, base_url)
}
