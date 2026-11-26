import JapanTaxLaw.CombinedRndExcessOver4Year

/-! # CombinedRndExcessOver4Year spec — 4%超の独立定式 (law 332AC0000000026 / art.42の4)
「百分の四」を 4/100 とし、「超える」を `100*r > 4*100` で判定する。 -/

namespace JapanTaxLaw.CombinedRndExcessOver4Year

def specThresholdNum : Nat := 4
def specRateDen : Nat := 100

def specExceeds4 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds4 4 = false := by decide
example : specExceeds4 5 = true := by decide

def agreeCombinedRndExcessOver4Year : Bool :=
  [0, 3, 4, 5, 12, 100].all fun r => exceeds4 r == specExceeds4 r

example : agreeCombinedRndExcessOver4Year = true := by decide

end JapanTaxLaw.CombinedRndExcessOver4Year
