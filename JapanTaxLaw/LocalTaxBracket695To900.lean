import JapanTaxLaw.TaxFinance

/-!
# LocalTaxBracket695To900 — 地方税法 art.37の2（695万円超900万円以下）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「六百九十五万円を超え九百万円以下の金額」
Computation: inRange(x) = x > 6_950_000 && x <= 9_000_000。
Scope: 課税標準の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxBracket695To900

def lowerYen : Nat := 6_950_000
def upperYen : Nat := 9_000_000

def inRange (yen : Nat) : Bool := yen > lowerYen && yen <= upperYen

example : inRange 6_950_000 = false := by decide
example : inRange 6_950_001 = true := by decide
example : inRange 9_000_000 = true := by decide
example : inRange 9_000_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket695To900
