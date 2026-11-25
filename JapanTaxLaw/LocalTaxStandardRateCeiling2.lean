import JapanTaxLaw.TaxFinance

/-!
# LocalTaxStandardRateCeiling2 — 地方税法 art.51 標準税率超過時の2%上限（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「ただし、標準税率を超える税率で課する場合においても、百分の二を超えることができない。」
Computation（上限判定のみ、入力は100分率の分子）:
  withinCeiling(rate) = rate <= 2  （「超えることができない」なので境界値 2 を含む）
Scope / NOT MODELLED: 標準税率そのもの・条例による税率決定・課税標準は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxStandardRateCeiling2

open JapanTaxLaw.TaxFinance

def ceilingPercent : Nat := 2

def withinCeiling (rate : Nat) : Bool :=
  rate <= ceilingPercent

example : withinCeiling 2 = true := by decide
example : withinCeiling 3 = false := by decide

end JapanTaxLaw.LocalTaxStandardRateCeiling2
