import JapanTaxLaw.TaxFinance

/-!
# SpecialMeasuresBracket95To130 — 租税特別措置法 art.5（95万円以上130万円未満）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「九十五万円以上百三十万円未満の金額」
Computation: inRange(x) = x >= 950_000 && x < 1_300_000（下限包含・上限除外）。
Scope: 金額の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.SpecialMeasuresBracket95To130

def lowerYen : Nat := 950_000
def upperYen : Nat := 1_300_000

def inRange (amount : Nat) : Bool := amount >= lowerYen && amount < upperYen

example : inRange 949_999 = false := by decide
example : inRange 950_000 = true := by decide
example : inRange 1_299_999 = true := by decide
example : inRange 1_300_000 = false := by decide

end JapanTaxLaw.SpecialMeasuresBracket95To130
