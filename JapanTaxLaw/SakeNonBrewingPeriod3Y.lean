import JapanTaxLaw.TaxFinance

/-!
# SakeNonBrewingPeriod3Y — 酒税法 art.12（酒類製造休止3年以上）
Sources (pinned): law `328AC0000000006` / rev `328AC0000000006_20260525_506AC0000000052`.
原文: 「三年以上引き続き酒類を製造しない場合」
Computation: atLeast3(years) = years >= 3（「以上」なので境界値 3 を含む）。
Scope: 継続性の判定・年月の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SakeNonBrewingPeriod3Y

def thresholdYears : Nat := 3

def atLeast3 (years : Nat) : Bool := years >= thresholdYears

example : atLeast3 2 = false := by decide
example : atLeast3 3 = true := by decide
example : atLeast3 4 = true := by decide

end JapanTaxLaw.SakeNonBrewingPeriod3Y
