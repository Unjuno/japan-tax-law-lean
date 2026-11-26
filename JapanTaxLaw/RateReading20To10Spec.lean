import JapanTaxLaw.RateReading20To10

/-! # RateReading20To10 spec — 読み替えの独立定式 (law 332AC0000000026 / art.37の3)
分母 100 を揃えた比較 `100*r == 20*100` で置換条件を再記述する。 -/

namespace JapanTaxLaw.RateReading20To10

def specSourceNum : Nat := 20
def specReplacementNum : Nat := 10
def specRateDen : Nat := 100

def specReadRate (rate : Nat) : Nat :=
  if specRateDen * rate == specSourceNum * specRateDen then specReplacementNum else rate

example : specReadRate 20 = 10 := by decide
example : specReadRate 25 = 25 := by decide

def agreeRateReading20To10 : Bool :=
  [0, 9, 10, 11, 19, 20, 21, 25, 100].all fun r => readRate r == specReadRate r

example : agreeRateReading20To10 = true := by decide

end JapanTaxLaw.RateReading20To10
