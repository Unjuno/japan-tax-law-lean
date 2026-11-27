import JapanTaxLaw.TaxFinance

/-!
# OpenSpaceRatioAtLeast20 — 租税特別措置法施行令 art.22の8（開放空地割合20%以上）
Sources (pinned): law `332CO0000000043` / rev `332CO0000000043_20261101_507CO0000000127`.
原文: 「日常一般に開放された空地の部分の面積の当該敷地の面積に対する割合が百分の二十以上であること。」
Computation: atLeast20(rate) = rate >= 20（「以上」なので境界値 20 を含む）。
Scope: 面積の算定・緩衝建築物の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.OpenSpaceRatioAtLeast20

def thresholdNum : Nat := 20
def rateDen : Nat := 100

def atLeast20 (rate : Nat) : Bool := rate >= thresholdNum

example : atLeast20 19 = false := by decide
example : atLeast20 20 = true := by decide
example : atLeast20 21 = true := by decide

end JapanTaxLaw.OpenSpaceRatioAtLeast20
