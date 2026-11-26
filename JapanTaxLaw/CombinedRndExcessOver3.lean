import JapanTaxLaw.TaxFinance

/-!
# CombinedRndExcessOver3 — 租税特別措置法 art.42の4「合算増減試験研究費割合が百分の三を超える場合」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「合算増減試験研究費割合が百分の三を超える場合（（３）に掲げる場合を除く。）」
Computation: exceeds3(rate) = rate > 3（「超える」なので境界値 3 は除外）。
Scope / NOT MODELLED: （３）の例外・合算割合の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CombinedRndExcessOver3

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 3
def rateDen : Nat := 100

def exceeds3 (rate : Nat) : Bool := rate > thresholdNum

example : exceeds3 2 = false := by decide
example : exceeds3 3 = false := by decide
example : exceeds3 4 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver3
