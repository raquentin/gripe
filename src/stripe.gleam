pub type ApiKey =
  String

pub opaque type StripeClient {
  StripeClient(api_key: ApiKey)
}

pub fn new(api_key: ApiKey) -> StripeClient {
  StripeClient(api_key)
}
