import gleam/http.{type Header, Get}
import gleam/http/request
import gleam/http/response
import gleam/httpc
import gleam/result

import stripe/error

pub type ApiKey =
  String

pub opaque type StripeClient {
  StripeClient(api_key: ApiKey)
}

pub fn new(api_key: ApiKey) -> StripeClient {
  StripeClient(api_key)
}

fn headers(client: StripeClient) -> List(Header) {
  [
    #("Authorization", "Bearer " <> client.api_key),
    #("Content-Type", "application/json"),
  ]
}

fn send_request(
  client: StripeClient,
  method: http.Method,
  path: String,
  params: List(#(String, String)),
) -> Result(String, StripeError) {
  let url = "https://api.stripe.com/v1/" <> path
  let body = http.url_encode(params)

  let assert Ok(request) =
    http.Request(method: method, url: url, headers: headers(client), body: body)

  use response <- result.try(httpc.send(request))

  case response.status {
    200 -> Ok(response.body)
    _ -> StripeError()
  }
}
