import JapanTaxLaw.RateReading20To25

/-! # RateReading20To25 spec — 読み替えの独立定式 (law 332AC0000000026 / art.37の3)
分母 100 を揃えた比較 `100*r == 20*100` で置換条件を再記述する。 -/

namespace JapanTaxLaw.RateReading20To25

def specSourceNum : Nat := 20
def specReplacementNum : Nat := 25
def specRateDen : Nat := 100

def specReadRate (rate : Nat) : Nat :=
  if specRateDen * rate == specSourceNum * specRateDen then specReplacementNum else rate

example : specReadRate 20 = 25 := by decide
example : specReadRate 10 = 10 := by decide

def agreeRateReading20To25 : Bool :=
  [0, 10, 19, 20, 21, 24, 25, 26, 100].all fun r => readRate r == specReadRate r

example : agreeRateReading20To25 = true := by decide

end JapanTaxLaw.RateReading20To25
