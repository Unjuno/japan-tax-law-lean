import JapanTaxLaw.TaxFinance

/-!
# RndExcessOver4Year — 租税特別措置法 art.10「増減試験研究費割合が百分の四を超える年分」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「増減試験研究費割合が百分の四を超える年分」
Computation（境界判定のみ。入力は100分率の分子）:
  exceeds4(rate) = rate > 4   （「超える」なので境界値 4 は除外）
Scope / NOT MODELLED: 割合の算定・年分の特定は NOT MODELLED。本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RndExcessOver4Year

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 4
def rateDen : Nat := 100

def exceeds4 (rate : Nat) : Bool :=
  rate > thresholdNum

example : exceeds4 3 = false := by decide
example : exceeds4 4 = false := by decide
example : exceeds4 5 = true := by decide

end JapanTaxLaw.RndExcessOver4Year
