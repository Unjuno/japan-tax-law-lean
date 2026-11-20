import JapanTaxLaw.GasolineTaxRate

/-! Independent restatement of 揮発油税法 art.9: bare Nat from 原文「二万四千三百円」。 -/

namespace JapanTaxLaw.GasolineTaxRate

def specRate : Nat := 24_300

example : specRate = 24_300 := by decide

def agreeGasolineTaxRate : Bool := gasolineTaxRate == specRate

example : agreeGasolineTaxRate = true := by decide

end JapanTaxLaw.GasolineTaxRate
