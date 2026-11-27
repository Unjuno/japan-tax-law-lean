import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantMissingPeriod2Y — 税理士法 art.25（所在不明2年以上）
Sources (pinned): law `326AC1000000237` / rev `326AC1000000237_20251001_505AC0000000053`.
原文: 「二年以上継続して所在が不明であるとき。」
Computation: atLeast2(years) = years >= 2（「以上」なので境界値 2 を含む）。
Scope: 継続性の判定・年月の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.TaxAccountantMissingPeriod2Y

def thresholdYears : Nat := 2

def atLeast2 (years : Nat) : Bool := years >= thresholdYears

example : atLeast2 1 = false := by decide
example : atLeast2 2 = true := by decide
example : atLeast2 3 = true := by decide

end JapanTaxLaw.TaxAccountantMissingPeriod2Y
