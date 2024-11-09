import gleam/option.{type Option}

import gripe/ids

pub type Application {
  Application(id: ids.ApplicationId, deleted: Bool, name: Option(String))
}
