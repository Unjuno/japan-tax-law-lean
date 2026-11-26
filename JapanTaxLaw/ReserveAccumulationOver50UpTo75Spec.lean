import JapanTaxLaw.ReserveAccumulationOver50UpTo75

/-! # ReserveAccumulationOver50UpTo75 spec — (50%,75%] の独立定式 (law 332CO0000000043 / art.33の3)
50/100 と 75/100 を交差乗算で扱い `100*r > 50*100 && 100*r <= 75*100` で判定する。 -/

namespace JapanTaxLaw.ReserveAccumulationOver50UpTo75

def specLowerNum : Nat := 50
def specUpperNum : Nat := 75
def specRateDen : Nat := 100

def specInRange (rate : Nat) : Bool :=
  specRateDen * rate > specLowerNum * specRateDen &&
  specRateDen * rate <= specUpperNum * specRateDen

example : specInRange 50 = false := by decide
example : specInRange 75 = true := by decide
example : specInRange 76 = false := by decide

def agreeReserveAccumulationOver50UpTo75 : Bool :=
  [0, 49, 50, 51, 74, 75, 76, 100].all fun r => inRange r == specInRange r

example : agreeReserveAccumulationOver50UpTo75 = true := by decide

end JapanTaxLaw.ReserveAccumulationOver50UpTo75
