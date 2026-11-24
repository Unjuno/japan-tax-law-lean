import JapanTaxLaw.SpecialMeasuresDistributionRatio90

/-!
# SpecialMeasuresDistributionRatio90 spec — 90/100 超過の独立定式
Sources (pinned): law 332AC0000000026, revision 332AC0000000026_20261101_507AC0000000013,
art. 68の3の3 (第六十八条の三の三). Independent restatement: rate > 90（100分率）。
-/

namespace JapanTaxLaw.SpecialMeasuresDistributionRatio90

def specThresholdNum : Nat := 90
def specThresholdDen : Nat := 100

def specExceeds90 (ratePerHundred : Nat) : Bool :=
  90 < ratePerHundred

example : specExceeds90 90 = false := by decide
example : specExceeds90 91 = true := by decide

def agreeSpecialMeasuresDistributionRatio90 : Bool :=
  [0, 1, 89, 90, 91, 99, 100, 101].all fun r =>
    exceeds90 r == specExceeds90 r

example : agreeSpecialMeasuresDistributionRatio90 = true := by decide

end JapanTaxLaw.SpecialMeasuresDistributionRatio90
