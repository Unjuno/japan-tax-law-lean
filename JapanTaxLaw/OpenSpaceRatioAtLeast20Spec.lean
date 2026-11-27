import JapanTaxLaw.OpenSpaceRatioAtLeast20

/-! # OpenSpaceRatioAtLeast20 spec — 20%以上の独立定式 (law 332CO0000000043 / art.22の8)
「百分の二十」を 20/100 とし、「以上」を `100*r >= 20*100` で判定する。 -/

namespace JapanTaxLaw.OpenSpaceRatioAtLeast20

def specThresholdNum : Nat := 20
def specRateDen : Nat := 100

def specAtLeast20 (rate : Nat) : Bool :=
  specRateDen * rate >= specThresholdNum * specRateDen

example : specAtLeast20 19 = false := by decide
example : specAtLeast20 20 = true := by decide

def agreeOpenSpaceRatioAtLeast20 : Bool :=
  [0, 19, 20, 21, 50, 100].all fun r => atLeast20 r == specAtLeast20 r

example : agreeOpenSpaceRatioAtLeast20 = true := by decide

end JapanTaxLaw.OpenSpaceRatioAtLeast20
