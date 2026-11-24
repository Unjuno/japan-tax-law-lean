import JapanTaxLaw.LocalBusinessOwnershipThreshold50

/-!
# LocalBusinessOwnershipThreshold50 spec — 50/100 超過の独立定式
Sources (pinned): law 329M50000002023, revision 329M50000002023_20261101_508M60000008045,
art. 3の13の3 (第三条の十三の三). Independent restatement: percent > 50（100分率）。
-/

namespace JapanTaxLaw.LocalBusinessOwnershipThreshold50

def specThresholdNum : Nat := 50
def specThresholdDen : Nat := 100

def specExceeds50 (percent : Nat) : Bool :=
  50 < percent

example : specExceeds50 50 = false := by decide
example : specExceeds50 51 = true := by decide

def agreeLocalBusinessOwnershipThreshold50 : Bool :=
  [0, 1, 49, 50, 51, 99, 100, 101].all fun p =>
    exceeds50 p == specExceeds50 p

example : agreeLocalBusinessOwnershipThreshold50 = true := by decide

end JapanTaxLaw.LocalBusinessOwnershipThreshold50
