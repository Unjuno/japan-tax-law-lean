import JapanTaxLaw.TaxFinance

/-!
# RndExcessOver3 — 租税特別措置法 art.10「増減試験研究費割合が百分の三を超える場合」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「増減試験研究費割合が百分の三を超える場合（第三号に掲げる場合を除く。）」
Computation（上限/下限の境界判定のみ。入力は100分率の分子）:
  exceeds3(rate) = rate > 3   （「超える」なので境界値 3 は除外）
Scope / NOT MODELLED: 第三号の例外、増減試験研究費割合の算定、税額計算は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RndExcessOver3

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 3
def rateDen : Nat := 100

def exceeds3 (rate : Nat) : Bool :=
  rate > thresholdNum

example : exceeds3 2 = false := by decide
example : exceeds3 3 = false := by decide
example : exceeds3 4 = true := by decide

end JapanTaxLaw.RndExcessOver3
