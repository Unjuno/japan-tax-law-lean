import JapanTaxLaw.ExtraDepreciationBelow10

/-! # ExtraDepreciationBelow10 spec — 10%未満の独立定式 (law 340CO0000000096 / art.133)
「百分の十」を 10/100 とし、「満たない」を `100*r < 10*100` で判定する。 -/

namespace JapanTaxLaw.ExtraDepreciationBelow10

def specThresholdNum : Nat := 10
def specRateDen : Nat := 100

def specBelow10 (rate : Nat) : Bool :=
  specRateDen * rate < specThresholdNum * specRateDen

example : specBelow10 9 = true := by decide
example : specBelow10 10 = false := by decide

def agreeExtraDepreciationBelow10 : Bool :=
  [0, 9, 10, 11, 50, 100].all fun r => below10 r == specBelow10 r

example : agreeExtraDepreciationBelow10 = true := by decide

end JapanTaxLaw.ExtraDepreciationBelow10
