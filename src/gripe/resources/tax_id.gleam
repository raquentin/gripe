import gleam/option.{type Option}

import gripe/ids
import gripe/resources/account.{type Account}
import gripe/resources/application.{type Application}
import gripe/resources/timestamp.{type Timestamp}
import gripe/utils/expandable.{type Expandable}

pub type TaxId {
  TaxId(
    id: ids.TaxIdId,
    country: Option(String),
    created: Option(Timestamp),
    // TODO: this won't resolve because customer relies on tax_id and vice versa
    customer: Option(Expandable(customer.Customer)),
    deleted: Bool,
    livemode: Optin(Bool),
    owner: Option(TaxIdsOwner),
    type_: Option(TaxIdType),
    value: Option(String),
    verification: Option(TaxIdVerification),
  )
}

pub type TaxIdsOwner {
  TaxIdsOwner(
    account: Option(Expandable(Account)),
    application: Option(Expandable(Application)),
    customer: Option(Expandable(customer.Customer)),
    type_: TaxIdsOwnerType,
  )
}

pub type TaxIdsOwnerType {
  Account
  Application
  Customer
  Self
}

pub type TaxIdType {
  AdNrt
  AeTrn
  ArCuit
  AuAbn
  AuArn
  BgUic
  BhVat
  BoTin
  BrCnpj
  BrCpf
  CaBn
  CaGstHst
  CaPstBc
  CaPstMb
  CaPstSk
  CaQst
  ChVat
  ClTin
  CnTin
  CoNit
  CrTin
  DoRcn
  EcRuc
  EgTin
  EsCif
  EuOssVat
  EuVat
  GbVat
  GeVat
  HkBr
  HuTin
  IdNpwp
  IlVat
  InGst
  IsVat
  JpCn
  JpRn
  JpTrn
  KePin
  KrBrn
  KzBin
  LiUid
  MxRfc
  MyFrp
  MyItn
  MySst
  NgTin
  NoVat
  NoVoec
  NzGst
  OmVat
  PeRuc
  PhTin
  RoTin
  RsPib
  RuInn
  RuKpp
  SaVat
  SgGst
  SgUen
  SiTin
  SvNit
  ThVat
  TrTin
  TwVat
  UaVat
  UsEin
  UyRuc
  VeRif
  VnTin
  ZaVat
  // For legacy tax IDs with type unknown
  Unknown
}

pub type TaxIdVerification {
  TaxIdVerification(
    status: TaxIdVerificationStatus,
    verified_address: Option(String),
    verified_name: Option(String),
  )
}

pub type TaxIdVerificationStatus {
  Pending
  Unavailable
  Unverified
  Verified
}

pub type TaxIds {
  TaxIds(object: String, data: List(TaxId), has_more: Bool, url: String)
}
