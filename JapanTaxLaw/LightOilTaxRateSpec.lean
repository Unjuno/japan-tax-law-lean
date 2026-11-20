import JapanTaxLaw.LightOilTaxRate

/-! Independent restatement: bare Nat literal re-derived from 原文「一万五千円」。 -/

namespace JapanTaxLaw.LightOilTaxRate

def specRate : Nat := 15000

example : specRate = 15000 := by decide

def agreeLightOilTaxRate : Bool := lightOilTaxRate == specRate

example : agreeLightOilTaxRate = true := by decide

end JapanTaxLaw.LightOilTaxRate
