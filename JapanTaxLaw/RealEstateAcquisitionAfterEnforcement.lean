import JapanTaxLaw.TaxFinance

/-!
# RealEstateAcquisitionAfterEnforcement — 地方税法 art.15（施行日以後の不動産取得への適用）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「新法第七十三条の二十七の二の規定は、施行日以後において不動産を取得した場合について適用する。」
Computation: 取得日（通算日番号）が施行日以上なら適用（「以後」なので施行日当日を含む）。
Scope: 日付の暦換算・不動産取得の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.RealEstateAcquisitionAfterEnforcement

def applies (acquisitionDay enforcementDay : Nat) : Bool :=
  acquisitionDay >= enforcementDay

example : applies 99 100 = false := by decide
example : applies 100 100 = true := by decide
example : applies 101 100 = true := by decide

end JapanTaxLaw.RealEstateAcquisitionAfterEnforcement
