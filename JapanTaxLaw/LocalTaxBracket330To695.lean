import JapanTaxLaw.TaxFinance

/-!
# LocalTaxBracket330To695 — 地方税法 art.37の2（330万円超695万円以下）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「三百三十万円を超え六百九十五万円以下の金額」
Computation: inRange(x) = x > 3_300_000 && x <= 6_950_000。
Scope: 課税標準の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxBracket330To695

def lowerYen : Nat := 3_300_000
def upperYen : Nat := 6_950_000

def inRange (yen : Nat) : Bool := yen > lowerYen && yen <= upperYen

example : inRange 3_300_000 = false := by decide
example : inRange 3_300_001 = true := by decide
example : inRange 6_950_000 = true := by decide
example : inRange 6_950_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket330To695
