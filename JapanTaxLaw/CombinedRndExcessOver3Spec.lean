import JapanTaxLaw.CombinedRndExcessOver3

/-! # CombinedRndExcessOver3 spec — 3%超の独立定式 (law 332AC0000000026 / art.42の4)
「百分の三」を 3/100 とし、「超える」を `100*r > 3*100` で判定する。 -/

namespace JapanTaxLaw.CombinedRndExcessOver3

def specThresholdNum : Nat := 3
def specRateDen : Nat := 100

def specExceeds3 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds3 3 = false := by decide
example : specExceeds3 4 = true := by decide

def agreeCombinedRndExcessOver3 : Bool :=
  [0, 2, 3, 4, 12, 100].all fun r => exceeds3 r == specExceeds3 r

example : agreeCombinedRndExcessOver3 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver3
