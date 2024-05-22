import startest.{describe, it}
import startest/expect

pub fn main() {
  startest.run(startest.default_config())
}

pub fn a_test() {
  2 + 2
  |> expect.to_equal(4)
}
