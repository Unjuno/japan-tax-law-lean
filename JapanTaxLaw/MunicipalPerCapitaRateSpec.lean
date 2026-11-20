import JapanTaxLaw.MunicipalPerCapitaRate

/-! Independent restatement: bare Nat literal re-derived from 原文「三千円」。 -/

namespace JapanTaxLaw.MunicipalPerCapitaRate

def specRate : Nat := 3000

example : specRate = 3000 := by decide

def agreeMunicipalPerCapitaRate : Bool := municipalPerCapitaRate == specRate

example : agreeMunicipalPerCapitaRate = true := by decide

end JapanTaxLaw.MunicipalPerCapitaRate
