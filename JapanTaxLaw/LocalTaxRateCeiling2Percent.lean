import JapanTaxLaw.TaxFinance

/-!
# LocalTaxRateCeiling2Percent — 地方税法 art.51 標準税率超過時の 2% 上限（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「ただし、標準税率を超える税率で課する場合においても、百分の二を超えることができない。」
Computation（上限判定のみ、入力は100分率の分子）:
  withinCeiling(ratePerHundred) = ratePerHundred <= 2
Scope / NOT MODELLED: 標準税率そのもの・課税標準・実際の税率決定・端数・条例改正手続は
NOT MODELLED。本モデルは上限 2/100 の判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxRateCeiling2Percent

open JapanTaxLaw.TaxFinance

/-- 原文の上限（百分の二）。 -/
def ceilingNum : Nat := 2
def ceilingDen : Nat := 100

/-- 所与の100分率が上限を超えないか（境界値 2 を含む）。 -/
def withinCeiling (ratePerHundred : Nat) : Bool :=
  ratePerHundred <= ceilingNum

example : withinCeiling 0 = true := by decide
example : withinCeiling 1 = true := by decide
example : withinCeiling 2 = true := by decide
example : withinCeiling 3 = false := by decide

end JapanTaxLaw.LocalTaxRateCeiling2Percent
