/// An Id or an Object.
/// Stripe returns Ids for most fields unless specified using the `expand` parameter.
/// See https://stripe.com/docs/api/expanding_objects.
pub type Expandable(inner) {
  Id(String)
  Object(inner)
}
