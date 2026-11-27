import JapanTaxLaw.TaxFinance

/-!
# LocalTaxBracketOver4000 — 地方税法 art.37の2（4000万円を超える金額）
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「四千万円を超える金額」
Computation: over4000(x) = x > 40_000_000（「超える」なので境界値 4000万は除外）。
Scope: 課税標準の算定・適用は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxBracketOver4000

def limitYen : Nat := 40_000_000

def over4000 (yen : Nat) : Bool := yen > limitYen

example : over4000 39_999_999 = false := by decide
example : over4000 40_000_000 = false := by decide
example : over4000 40_000_001 = true := by decide

end JapanTaxLaw.LocalTaxBracketOver4000
