import JapanTaxLaw.InheritedAnnuityRatioAtMost50

/-! # InheritedAnnuityRatioAtMost50 spec — 50%以下の独立定式 (law 340CO0000000096 / art.185)
「百分の五十」を 50/100 とし、「以下」を `100*r <= 50*100` で判定する。 -/

namespace JapanTaxLaw.InheritedAnnuityRatioAtMost50

def specThresholdNum : Nat := 50
def specRateDen : Nat := 100

def specAtMost50 (rate : Nat) : Bool :=
  specRateDen * rate <= specThresholdNum * specRateDen

example : specAtMost50 50 = true := by decide
example : specAtMost50 51 = false := by decide

def agreeInheritedAnnuityRatioAtMost50 : Bool :=
  [0, 49, 50, 51, 100].all fun r => atMost50 r == specAtMost50 r

example : agreeInheritedAnnuityRatioAtMost50 = true := by decide

end JapanTaxLaw.InheritedAnnuityRatioAtMost50
