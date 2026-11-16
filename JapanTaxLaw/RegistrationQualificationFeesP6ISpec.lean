import JapanTaxLaw.RegistrationQualificationFeesP6I

/-!
# RegistrationQualificationFeesP6ISpec spec — independent restatement of
      登録免許税法 別表第一（二）第三十二号 百二十〜百二十四

Sources (pinned; identical to RegistrationQualificationFeesP6I.lean):

  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
  Raw snapshot: data/raw/342AC0000000035_20261101_508AC0000000021.law.json

Independent restatement of 百二十〜百二十四 の flat 額 from the statutory text itself.
全 12 件が一件につきの固定額（割合なし）。百二十（一）（三）（四）の無軌条の路線に
係る九万円の軽減代替、および百二十・百二十三の（注）のみなし規定は金額なし行として
扱い spec def を作らない。

Scope boundaries identical to the implementation（百十九 以前・百二十五 以降は
NOT YET COVERED; 「政令で定めるものを除く。」「更新の登録を除く。」等の適用判定は
caller-established）。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: 百二十（一） 第一種・第二種・第三種鉄道事業の許可。 -/
def specRailwayBusinessPermitFee : Money := 150_000
/-- Spec: 百二十（二） 索道事業の許可。 -/
def specRopewayBusinessPermitFee : Money := 30_000
/-- Spec: 百二十（三） 軌道事業の特許。 -/
def specTramwayBusinessFranchiseFee : Money := 150_000
/-- Spec: 百二十（四） 軌道事業から鉄道事業への変更の許可。 -/
def specTramwayToRailwayChangePermitFee : Money := 150_000
/-- Spec: 百二十一 自動車道事業の免許。 -/
def specMotorwayBusinessLicenseFee : Money := 150_000
/-- Spec: 百二十二 高速道路の新設又は改築の許可。 -/
def specExpresswayConstructionPermitFee : Money := 150_000
/-- Spec: 百二十三 自動車ターミナル事業の許可。 -/
def specMotorTerminalBusinessPermitFee : Money := 90_000
/-- Spec: 百二十四（一）イ 点検付随整備事業の全部の実施に係る認定。 -/
def specFullInspectionAttachedMaintenanceCertFee : Money := 90_000
/-- Spec: 百二十四（一）ロ 点検付随整備事業の一部の実施に係る認定。 -/
def specPartialInspectionAttachedMaintenanceCertFee : Money := 60_000
/-- Spec: 百二十四（一）ハ イ及びロに掲げる認定以外の認定。 -/
def specOtherMaintenanceCertFee : Money := 30_000
/-- Spec: 百二十四（二） 登録情報処理機関の登録。 -/
def specVehicleRegistrationInfoProcessingOrgRegFee : Money := 90_000
/-- Spec: 百二十四（三） 登録情報提供機関の登録。 -/
def specVehicleRegistrationInfoProvidingOrgRegFee : Money := 90_000

example : specRailwayBusinessPermitFee = 150_000 := by decide
example : specRopewayBusinessPermitFee = 30_000 := by decide
example : specTramwayBusinessFranchiseFee = 150_000 := by decide
example : specTramwayToRailwayChangePermitFee = 150_000 := by decide
example : specMotorwayBusinessLicenseFee = 150_000 := by decide
example : specExpresswayConstructionPermitFee = 150_000 := by decide
example : specMotorTerminalBusinessPermitFee = 90_000 := by decide
example : specFullInspectionAttachedMaintenanceCertFee = 90_000 := by decide
example : specPartialInspectionAttachedMaintenanceCertFee = 60_000 := by decide
example : specOtherMaintenanceCertFee = 30_000 := by decide
example : specVehicleRegistrationInfoProcessingOrgRegFee = 90_000 := by decide
example : specVehicleRegistrationInfoProvidingOrgRegFee = 90_000 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeRegistrationQualificationFeesP6I : Bool :=
  specRailwayBusinessPermitFee == railwayBusinessPermitFee &&
  specRopewayBusinessPermitFee == ropewayBusinessPermitFee &&
  specTramwayBusinessFranchiseFee == tramwayBusinessFranchiseFee &&
  specTramwayToRailwayChangePermitFee == tramwayToRailwayChangePermitFee &&
  specMotorwayBusinessLicenseFee == motorwayBusinessLicenseFee &&
  specExpresswayConstructionPermitFee == expresswayConstructionPermitFee &&
  specMotorTerminalBusinessPermitFee == motorTerminalBusinessPermitFee &&
  specFullInspectionAttachedMaintenanceCertFee == fullInspectionAttachedMaintenanceCertFee &&
  specPartialInspectionAttachedMaintenanceCertFee == partialInspectionAttachedMaintenanceCertFee &&
  specOtherMaintenanceCertFee == otherMaintenanceCertFee &&
  specVehicleRegistrationInfoProcessingOrgRegFee == vehicleRegistrationInfoProcessingOrgRegFee &&
  specVehicleRegistrationInfoProvidingOrgRegFee == vehicleRegistrationInfoProvidingOrgRegFee

example : agreeRegistrationQualificationFeesP6I = true := by decide

end JapanTaxLaw
