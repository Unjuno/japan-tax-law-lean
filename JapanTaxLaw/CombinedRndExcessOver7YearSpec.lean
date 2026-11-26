import JapanTaxLaw.CombinedRndExcessOver7Year

/-! # CombinedRndExcessOver7Year spec — 7%超の独立定式 (law 332AC0000000026 / art.42の4)
「百分の七」を 7/100 とし、「超える」を `100*r > 7*100` で判定する。 -/

namespace JapanTaxLaw.CombinedRndExcessOver7Year

def specThresholdNum : Nat := 7
def specRateDen : Nat := 100

def specExceeds7 (rate : Nat) : Bool :=
  specRateDen * rate > specThresholdNum * specRateDen

example : specExceeds7 7 = false := by decide
example : specExceeds7 8 = true := by decide

def agreeCombinedRndExcessOver7Year : Bool :=
  [0, 3, 6, 7, 8, 12, 100].all fun r => exceeds7 r == specExceeds7 r

example : agreeCombinedRndExcessOver7Year = true := by decide

end JapanTaxLaw.CombinedRndExcessOver7Year
