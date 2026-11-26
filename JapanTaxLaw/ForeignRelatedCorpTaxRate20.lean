import JapanTaxLaw.TaxFinance

/-!
# ForeignRelatedCorpTaxRate20 — 租税特別措置法 art.40の7（対象外国関係法人の租税負担割合20%以上）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「対象外国関係法人の各事業年度の租税負担割合が百分の二十以上である場合」
Computation: atLeast20(rate) = rate >= 20（「以上」なので境界値 20 を含む）。
Scope: 租税負担割合の算定・法人認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.ForeignRelatedCorpTaxRate20

def thresholdNum : Nat := 20
def rateDen : Nat := 100

def atLeast20 (rate : Nat) : Bool := rate >= thresholdNum

example : atLeast20 19 = false := by decide
example : atLeast20 20 = true := by decide
example : atLeast20 21 = true := by decide

end JapanTaxLaw.ForeignRelatedCorpTaxRate20
