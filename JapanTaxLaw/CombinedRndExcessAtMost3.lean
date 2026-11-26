import JapanTaxLaw.TaxFinance

/-!
# CombinedRndExcessAtMost3 — 租税特別措置法 art.42の4「合算増減試験研究費割合が百分の三以下」

Sources (pinned): law `332AC0000000026`, revision `332AC0000000026_20261101_507AC0000000013`,
raw `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`.
原文逐語: 「合算増減試験研究費割合が百分の三以下である場合（（３）に掲げる場合を除く。）」
Computation: atMost3(rate) = rate <= 3（「以下」なので境界値 3 を含む）。
Scope / NOT MODELLED: （３）の例外・合算割合の算定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CombinedRndExcessAtMost3

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 3
def rateDen : Nat := 100

def atMost3 (rate : Nat) : Bool := rate <= thresholdNum

example : atMost3 3 = true := by decide
example : atMost3 4 = false := by decide

end JapanTaxLaw.CombinedRndExcessAtMost3
