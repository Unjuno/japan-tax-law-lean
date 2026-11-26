import JapanTaxLaw.ContinuingIncreaseAtLeast5

/-! # ContinuingIncreaseAtLeast5 spec — 5%以上の独立定式
law `332AC0000000026` / art.10の5の4. 「百分の五」を 5/100 とし、
「以上」を `100*r >= 5*100` で判定する。 -/

namespace JapanTaxLaw.ContinuingIncreaseAtLeast5

def specThresholdNum : Nat := 5
def specRateDen : Nat := 100

def specAtLeast5 (rate : Nat) : Bool :=
  specRateDen * rate >= specThresholdNum * specRateDen

example : specAtLeast5 4 = false := by decide
example : specAtLeast5 5 = true := by decide

def agreeContinuingIncreaseAtLeast5 : Bool :=
  [0, 4, 5, 6, 15, 100].all fun r => atLeast5 r == specAtLeast5 r

example : agreeContinuingIncreaseAtLeast5 = true := by decide

end JapanTaxLaw.ContinuingIncreaseAtLeast5
