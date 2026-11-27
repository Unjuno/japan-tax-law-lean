import JapanTaxLaw.SpecialMeasuresRate90

/-! # SpecialMeasuresRate90 spec — 90%の独立定式 (law 332M50000040015 / art.19の5)
原文の「百分の九十」を分数 90/100 として再記述する。 -/

namespace JapanTaxLaw.SpecialMeasuresRate90

def specRateNum : Nat := 90
def specRateDen : Nat := 100

def specStatutoryRate : Nat := specRateNum

example : specStatutoryRate = 90 := by decide

def agreeSpecialMeasuresRate90 : Bool :=
  statutoryRate == specStatutoryRate

example : agreeSpecialMeasuresRate90 = true := by decide

end JapanTaxLaw.SpecialMeasuresRate90
