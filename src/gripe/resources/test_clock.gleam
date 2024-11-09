pub type TestClock {
  TestClock(
    id: ids.TestClockId,
    created: Option(Timestamp),
    deleted: Bool,
    deletes_after: Option(Timestamp),
    frozen_time: Option(Timestamp),
    livemode: Option(Bool),
    name: Option(String),
    status: Option(TestClockStatus),
  )
}

pub type TestClockStatus {
  Advancing
  InternalFailure
  Ready
}
