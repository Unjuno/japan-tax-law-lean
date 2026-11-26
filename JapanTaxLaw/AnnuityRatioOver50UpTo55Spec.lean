import JapanTaxLaw.AnnuityRatioOver50UpTo55

/-! # AnnuityRatioOver50UpTo55 spec — (50%, 55%] 区間の独立定式 (law 340CO0000000096 / art.185)
50/100 と 55/100 を交差乗算で扱い `100*r > 50*100 && 100*r <= 55*100` で判定する。 -/

namespace JapanTaxLaw.AnnuityRatioOver50UpTo55

def specLowerNum : Nat := 50
def specUpperNum : Nat := 55
def specRateDen : Nat := 100

def specInRange (rate : Nat) : Bool :=
  specRateDen * rate > specLowerNum * specRateDen &&
  specRateDen * rate <= specUpperNum * specRateDen

example : specInRange 50 = false := by decide
example : specInRange 55 = true := by decide
example : specInRange 56 = false := by decide

def agreeAnnuityRatioOver50UpTo55 : Bool :=
  [0, 49, 50, 51, 54, 55, 56, 100].all fun r => inRange r == specInRange r

example : agreeAnnuityRatioOver50UpTo55 = true := by decide

end JapanTaxLaw.AnnuityRatioOver50UpTo55
