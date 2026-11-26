import JapanTaxLaw.TaxFinance

/-!
# RndExcessOver15 — 租税特別措置法 art.10「増減試験研究費割合が百分の十五を超える場合」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「増減試験研究費割合が百分の十五を超える場合（ニに掲げる場合を除く。）」
Computation（境界判定のみ。入力は100分率の分子）:
  exceeds15(rate) = rate > 15   （「超える」なので境界値 15 は除外）
Scope / NOT MODELLED: 「ニに掲げる場合」の例外、割合の算定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.RndExcessOver15

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 15
def rateDen : Nat := 100

def exceeds15 (rate : Nat) : Bool :=
  rate > thresholdNum

example : exceeds15 14 = false := by decide
example : exceeds15 15 = false := by decide
example : exceeds15 16 = true := by decide

end JapanTaxLaw.RndExcessOver15
