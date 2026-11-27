import JapanTaxLaw.TaxFinance

/-!
# DomesticRealEstateRatioAtLeast50 — 相互主義非課税法施行令 art.7（国内不動産割合50%以上）
Sources (pinned): law `337CO0000000227` / rev `337CO0000000227_20260401_508CO0000000083`.
原文: 「国内不動産の価額の合計額の占める割合が百分の五十以上である法人の株式」
Computation: atLeast50(rate) = rate >= 50（「以上」なので境界値 50 を含む）。
Scope: 資産価額の算定・法人認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.DomesticRealEstateRatioAtLeast50

def thresholdNum : Nat := 50
def rateDen : Nat := 100

def atLeast50 (rate : Nat) : Bool := rate >= thresholdNum

example : atLeast50 49 = false := by decide
example : atLeast50 50 = true := by decide
example : atLeast50 51 = true := by decide

end JapanTaxLaw.DomesticRealEstateRatioAtLeast50
