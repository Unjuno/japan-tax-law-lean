import JapanTaxLaw.RegistrationQualificationFeesP6I

/-!
# RegistrationQualificationFeesP6I tests — 別表第一（二）第三十二号 百二十〜百二十四 smoke checks

Decidable smoke tests for the flat fees, pinned to
  Law id: 342AC0000000035
  Revision: 342AC0000000035_20261101_508AC0000000021
  Amendment enforcement date: 2026-11-01
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- 百二十（一）（三）（四） 鉄道事業の許可・軌道事業の特許・変更の許可（¥150,000）
example : railwayBusinessPermitFee = 150_000 := by decide
example : tramwayBusinessFranchiseFee = 150_000 := by decide
example : tramwayToRailwayChangePermitFee = 150_000 := by decide
-- 百二十（二） 索道事業の許可（¥30,000）
example : ropewayBusinessPermitFee = 30_000 := by decide
-- 百二十一 / 百二十二 自動車道事業の免許・高速道路の新設改築の許可（¥150,000）
example : motorwayBusinessLicenseFee = 150_000 := by decide
example : expresswayConstructionPermitFee = 150_000 := by decide
-- 百二十三 自動車ターミナル事業の許可（¥90,000）
example : motorTerminalBusinessPermitFee = 90_000 := by decide
-- 百二十四（一）イ〜ハ 点検付随整備事業に係る認定（¥90,000 / ¥60,000 / ¥30,000）
example : fullInspectionAttachedMaintenanceCertFee = 90_000 := by decide
example : partialInspectionAttachedMaintenanceCertFee = 60_000 := by decide
example : otherMaintenanceCertFee = 30_000 := by decide
-- 百二十四（二）（三） 登録情報処理機関・登録情報提供機関の登録（¥90,000）
example : vehicleRegistrationInfoProcessingOrgRegFee = 90_000 := by decide
example : vehicleRegistrationInfoProvidingOrgRegFee = 90_000 := by decide

end JapanTaxLaw
