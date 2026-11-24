import JapanTaxLaw.SpecialMeasuresOwnershipThreshold50

/-!
# SpecialMeasuresOwnershipThreshold50 spec — 50/100 超過の独立定式
Sources (pinned): law 332CO0000000043, revision 332CO0000000043_20261101_507CO0000000127,
art. 19の3 (第十九条の三). Independent restatement: percent > 50（100分率）。
-/

namespace JapanTaxLaw.SpecialMeasuresOwnershipThreshold50

def specThresholdNum : Nat := 50
def specThresholdDen : Nat := 100

def specExceeds50 (percent : Nat) : Bool :=
  50 < percent

example : specExceeds50 50 = false := by decide
example : specExceeds50 51 = true := by decide

def agreeSpecialMeasuresOwnershipThreshold50 : Bool :=
  [0, 1, 49, 50, 51, 99, 100, 101].all fun p =>
    exceeds50 p == specExceeds50 p

example : agreeSpecialMeasuresOwnershipThreshold50 = true := by decide

end JapanTaxLaw.SpecialMeasuresOwnershipThreshold50
