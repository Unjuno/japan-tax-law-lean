import JapanTaxLaw.TaxFinance

/-!
# CombinedRndExcessOver7Year — 租税特別措置法 art.42の4「増減試験研究費割合が百分の七を超える事業年度」
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「増減試験研究費割合が百分の七を超える事業年度」
Computation: exceeds7(rate) = rate > 7（「超える」で境界値 7 は除外）。
Scope: 割合の算定・事業年度の特定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CombinedRndExcessOver7Year

open JapanTaxLaw.TaxFinance

def thresholdNum : Nat := 7
def rateDen : Nat := 100

def exceeds7 (rate : Nat) : Bool := rate > thresholdNum

example : exceeds7 6 = false := by decide
example : exceeds7 7 = false := by decide
example : exceeds7 8 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver7Year
