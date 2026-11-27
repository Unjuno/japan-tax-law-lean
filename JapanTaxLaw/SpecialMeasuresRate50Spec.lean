import JapanTaxLaw.SpecialMeasuresRate50

/-! # SpecialMeasuresRate50 spec — 50%の独立定式 (law 332M50000040015 / art.12)
原文の「百分の五十」を分数 50/100 として再記述する。 -/

namespace JapanTaxLaw.SpecialMeasuresRate50

def specRateNum : Nat := 50
def specRateDen : Nat := 100

def specStatutoryRate : Nat := specRateNum

example : specStatutoryRate = 50 := by decide

def agreeSpecialMeasuresRate50 : Bool :=
  statutoryRate == specStatutoryRate

example : agreeSpecialMeasuresRate50 = true := by decide

end JapanTaxLaw.SpecialMeasuresRate50
