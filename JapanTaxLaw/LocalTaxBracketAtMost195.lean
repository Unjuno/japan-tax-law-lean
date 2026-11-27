import JapanTaxLaw.TaxFinance

/-!
# LocalTaxBracketAtMost195 — 地方税法 art.37の2（195万円以下）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「百九十五万円以下の金額」
Computation: atMost(x) = x <= 1_950_000（「以下」なので境界値 195万を含む）。
Scope: 課税標準の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxBracketAtMost195

def limitYen : Nat := 1_950_000

def atMost (yen : Nat) : Bool := yen <= limitYen

example : atMost 1_949_999 = true := by decide
example : atMost 1_950_000 = true := by decide
example : atMost 1_950_001 = false := by decide

end JapanTaxLaw.LocalTaxBracketAtMost195
