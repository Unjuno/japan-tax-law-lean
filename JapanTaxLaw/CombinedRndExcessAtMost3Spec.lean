import JapanTaxLaw.CombinedRndExcessAtMost3

/-! # CombinedRndExcessAtMost3 spec — 3%以下の独立定式 (law 332AC0000000026 / art.42の4)
「百分の三」を 3/100 とし、「以下」を `100*r <= 3*100` で判定する。 -/

namespace JapanTaxLaw.CombinedRndExcessAtMost3

def specThresholdNum : Nat := 3
def specRateDen : Nat := 100

def specAtMost3 (rate : Nat) : Bool :=
  specRateDen * rate <= specThresholdNum * specRateDen

example : specAtMost3 3 = true := by decide
example : specAtMost3 4 = false := by decide

def agreeCombinedRndExcessAtMost3 : Bool :=
  [0, 1, 2, 3, 4, 12, 100].all fun r => atMost3 r == specAtMost3 r

example : agreeCombinedRndExcessAtMost3 = true := by decide

end JapanTaxLaw.CombinedRndExcessAtMost3
