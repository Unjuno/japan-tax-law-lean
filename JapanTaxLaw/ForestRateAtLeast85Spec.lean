import JapanTaxLaw.ForestRateAtLeast85

/-! # ForestRateAtLeast85 spec — 85%以上の独立定式 (law 431M60000008040 / art.1の3)
「百分の八十五」を 85/100 とし、「以上」を `100*r >= 85*100` で判定する。 -/

namespace JapanTaxLaw.ForestRateAtLeast85

def specThresholdNum : Nat := 85
def specRateDen : Nat := 100

def specAtLeast85 (rate : Nat) : Bool :=
  specRateDen * rate >= specThresholdNum * specRateDen

example : specAtLeast85 84 = false := by decide
example : specAtLeast85 85 = true := by decide

def agreeForestRateAtLeast85 : Bool :=
  [0, 84, 85, 86, 100].all fun r => atLeast85 r == specAtLeast85 r

example : agreeForestRateAtLeast85 = true := by decide

end JapanTaxLaw.ForestRateAtLeast85
