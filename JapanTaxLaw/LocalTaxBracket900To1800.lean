import JapanTaxLaw.TaxFinance

/-!
# LocalTaxBracket900To1800 — 地方税法 art.37の2（900万円超1800万円以下）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「九百万円を超え千八百万円以下の金額」
Computation: inRange(x) = x > 9_000_000 && x <= 18_000_000。
Scope: 課税標準の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxBracket900To1800

def lowerYen : Nat := 9_000_000
def upperYen : Nat := 18_000_000

def inRange (yen : Nat) : Bool := yen > lowerYen && yen <= upperYen

example : inRange 9_000_000 = false := by decide
example : inRange 9_000_001 = true := by decide
example : inRange 18_000_000 = true := by decide
example : inRange 18_000_001 = false := by decide

end JapanTaxLaw.LocalTaxBracket900To1800
