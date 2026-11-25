import JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold

/-!
# InheritanceTaxOrderOwnership50Threshold spec — 50/100 超過の独立定式
Sources (pinned): law 325CO0000000071, revision 325CO0000000071_20260401_506CO0000000143,
art. 31 (第三十一条). Independent restatement: percent > 50（100分率）。
-/

namespace JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold

def specThresholdNum : Nat := 50
def specThresholdDen : Nat := 100

def specExceeds50 (percent : Nat) : Bool :=
  50 < percent

example : specExceeds50 50 = false := by decide
example : specExceeds50 51 = true := by decide

def agreeInheritanceTaxOrderOwnership50Threshold : Bool :=
  [0, 1, 49, 50, 51, 99, 100, 101].all fun p =>
    exceeds50 p == specExceeds50 p

example : agreeInheritanceTaxOrderOwnership50Threshold = true := by decide

end JapanTaxLaw.InheritanceTaxOrderOwnership50Threshold
