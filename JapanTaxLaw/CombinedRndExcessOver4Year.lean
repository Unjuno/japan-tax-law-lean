import JapanTaxLaw.TaxFinance

/-!
# CombinedRndExcessOver4Year — 租税特別措置法 art.42の4「増減試験研究費割合が百分の四を超える事業年度」
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「増減試験研究費割合が百分の四を超える事業年度」
Computation: exceeds4(rate) = rate > 4（「超える」で境界値 4 は除外）。
Scope: 割合の算定・事業年度の特定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CombinedRndExcessOver4Year

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 4
def rateDen : Nat := 100

def exceeds4 (rate : Nat) : Bool := rate > thresholdNum

example : exceeds4 3 = false := by decide
example : exceeds4 4 = false := by decide
example : exceeds4 5 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver4Year
