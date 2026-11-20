import JapanTaxLaw.PrefecturalPerCapitaRate

/-! Independent restatement: bare Nat literal re-derived from 原文「千円」。 -/

namespace JapanTaxLaw.PrefecturalPerCapitaRate

def specRate : Nat := 1000

example : specRate = 1000 := by decide

def agreePrefecturalPerCapitaRate : Bool := prefecturalPerCapitaRate == specRate

example : agreePrefecturalPerCapitaRate = true := by decide

end JapanTaxLaw.PrefecturalPerCapitaRate
