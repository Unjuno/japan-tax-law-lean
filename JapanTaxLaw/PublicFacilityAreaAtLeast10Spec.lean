import JapanTaxLaw.PublicFacilityAreaAtLeast10

/-! # PublicFacilityAreaAtLeast10 spec — 10%以上の独立定式 (law 332CO0000000043 / art.43の2)
「百分の十」を 10/100 とし、「以上」を `100*r >= 10*100` で判定する。 -/

namespace JapanTaxLaw.PublicFacilityAreaAtLeast10

def specThresholdNum : Nat := 10
def specRateDen : Nat := 100

def specAtLeast10 (rate : Nat) : Bool :=
  specRateDen * rate >= specThresholdNum * specRateDen

example : specAtLeast10 9 = false := by decide
example : specAtLeast10 10 = true := by decide

def agreePublicFacilityAreaAtLeast10 : Bool :=
  [0, 9, 10, 11, 50, 100].all fun r => atLeast10 r == specAtLeast10 r

example : agreePublicFacilityAreaAtLeast10 = true := by decide

end JapanTaxLaw.PublicFacilityAreaAtLeast10
