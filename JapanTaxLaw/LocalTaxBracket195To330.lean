import JapanTaxLaw.TaxFinance

/-!
# LocalTaxBracket195To330 — 地方税法 art.37の2（195万円超330万円以下）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「百九十五万円を超え三百三十万円以下の金額」
Computation: inRange(x) = x > 1_950_000 && x <= 3_300_000（下限除外・上限包含）。
Scope: 課税標準の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxBracket195To330

def lowerYen : Nat := 1_950_000
def upperYen : Nat := 3_300_000

def inRange (yen : Nat) : Bool := yen > lowerYen && yen <= upperYen

example : inRange 1_950_000 = false := by decide
example : inRange 1_950_001 = true := by decide
example : inRange 3_300_000 = true := by decide
example : inRange 3_300_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket195To330
