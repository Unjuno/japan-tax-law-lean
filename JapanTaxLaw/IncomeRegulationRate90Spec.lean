import JapanTaxLaw.IncomeRegulationRate90

/-! # IncomeRegulationRate90 spec — 90%の独立定式 (law 340M50000040011 / art.90の2)
「百分の九十」を分数 90/100 として再記述する。 -/

namespace JapanTaxLaw.IncomeRegulationRate90

def specRateNum : Nat := 90
def specRateDen : Nat := 100

def specStatutoryRate : Nat := specRateNum

example : specStatutoryRate = 90 := by decide

def agreeIncomeRegulationRate90 : Bool :=
  statutoryRate == specStatutoryRate

example : agreeIncomeRegulationRate90 = true := by decide

end JapanTaxLaw.IncomeRegulationRate90
