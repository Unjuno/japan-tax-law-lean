import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresBracket50To80M — 租税特別措置法 art.87（5000万円超8000万円以下）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「五千万円を超え八千万円以下の金額」
Computation: inRange(x) = x > 50_000_000 && x <= 80_000_000。
Scope: 金額の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresBracket50To80M

def lowerYen : Nat := 50_000_000
def upperYen : Nat := 80_000_000

def inRange (yen : Nat) : Bool := yen > lowerYen && yen <= upperYen

example : inRange 50_000_000 = false := by decide
example : inRange 50_000_001 = true := by decide
example : inRange 80_000_000 = true := by decide
example : inRange 80_000_001 = false := by decide

end JapanTaxLaw.SpecialMeasuresBracket50To80M
