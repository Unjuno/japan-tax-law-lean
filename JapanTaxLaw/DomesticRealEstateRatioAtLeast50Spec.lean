import JapanTaxLaw.DomesticRealEstateRatioAtLeast50

/-! # DomesticRealEstateRatioAtLeast50 spec — 50%以上の独立定式 (law 337CO0000000227 / art.7)
「百分の五十」を 50/100 とし、「以上」を `100*r >= 50*100` で判定する。 -/

namespace JapanTaxLaw.DomesticRealEstateRatioAtLeast50

def specThresholdNum : Nat := 50
def specRateDen : Nat := 100

def specAtLeast50 (rate : Nat) : Bool :=
  specRateDen * rate >= specThresholdNum * specRateDen

example : specAtLeast50 49 = false := by decide
example : specAtLeast50 50 = true := by decide

def agreeDomesticRealEstateRatioAtLeast50 : Bool :=
  [0, 49, 50, 51, 100].all fun r => atLeast50 r == specAtLeast50 r

example : agreeDomesticRealEstateRatioAtLeast50 = true := by decide

end JapanTaxLaw.DomesticRealEstateRatioAtLeast50
