import JapanTaxLaw.TaxFinance

/-!
# InheritanceDemandAfterEnforcement — 相続税法 art.18（施行日以後の督促への適用）
Sources (pinned): law `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`.
原文: 「新相続税法第三十四条第八項の規定は、施行日以後にする国税通則法第三十七条の規定による督促について適用する。」
Computation: 督促日（通算日番号）が施行日以上なら適用（「以後」なので施行日当日を含む）。
Scope: 日付の暦換算・督促の効力は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.InheritanceDemandAfterEnforcement

def applies (demandDay enforcementDay : Nat) : Bool :=
  demandDay >= enforcementDay

example : applies 99 100 = false := by decide
example : applies 100 100 = true := by decide
example : applies 101 100 = true := by decide

end JapanTaxLaw.InheritanceDemandAfterEnforcement
