import JapanTaxLaw.TaxFinance

/-!
# LightOilNonHandlingPeriod1Y — 地方税法施行令 art.43の8（軽油取扱い休止1年以上）
Sources (pinned): law `325CO0000000245` / rev `325CO0000000245_20261101_508CO0000000083`.
原文: 「一年以上引き続き軽油の製造、輸入又は販売をしていないこと。」
Computation: atLeast1(years) = years >= 1（「以上」なので境界値 1 を含む）。
Scope: 継続性の判定・年月の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LightOilNonHandlingPeriod1Y

def thresholdYears : Nat := 1

def atLeast1 (years : Nat) : Bool := years >= thresholdYears

example : atLeast1 0 = false := by decide
example : atLeast1 1 = true := by decide
example : atLeast1 2 = true := by decide

end JapanTaxLaw.LightOilNonHandlingPeriod1Y
