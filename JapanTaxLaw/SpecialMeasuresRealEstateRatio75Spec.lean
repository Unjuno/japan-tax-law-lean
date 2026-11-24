import JapanTaxLaw.SpecialMeasuresRealEstateRatio75

/-!
# SpecialMeasuresRealEstateRatio75 spec — 75/100 以上の独立定式
Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013,
art. 83の2の2 (第八十三条の二の二). Independent restatement: rate >= 75（100分率）。
-/

namespace JapanTaxLaw.SpecialMeasuresRealEstateRatio75

def specThresholdNum : Nat := 75
def specThresholdDen : Nat := 100

def specAtLeast75 (ratePerHundred : Nat) : Bool :=
  75 <= ratePerHundred

example : specAtLeast75 74 = false := by decide
example : specAtLeast75 75 = true := by decide

def agreeSpecialMeasuresRealEstateRatio75 : Bool :=
  [0, 1, 74, 75, 76, 99, 100, 101].all fun r =>
    atLeast75 r == specAtLeast75 r

example : agreeSpecialMeasuresRealEstateRatio75 = true := by decide

end JapanTaxLaw.SpecialMeasuresRealEstateRatio75
