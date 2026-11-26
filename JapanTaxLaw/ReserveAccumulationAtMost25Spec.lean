import JapanTaxLaw.ReserveAccumulationAtMost25

/-! # ReserveAccumulationAtMost25 spec — 25%以下の独立定式
law `332CO0000000043` / art.33の3. 「百分の二十五」を 25/100 とし、
「以下」を `100*r <= 25*100` で判定する。 -/

namespace JapanTaxLaw.ReserveAccumulationAtMost25

def specThresholdNum : Nat := 25
def specRateDen : Nat := 100

def specAtMost25 (rate : Nat) : Bool :=
  specRateDen * rate <= specThresholdNum * specRateDen

example : specAtMost25 25 = true := by decide
example : specAtMost25 26 = false := by decide

def agreeReserveAccumulationAtMost25 : Bool :=
  [0, 24, 25, 26, 50, 100].all fun r => atMost25 r == specAtMost25 r

example : agreeReserveAccumulationAtMost25 = true := by decide

end JapanTaxLaw.ReserveAccumulationAtMost25
