import JapanTaxLaw.GasolineTaxRate

/-! Kernel-decided smoke checks for 揮発油税法 art.9. -/

namespace JapanTaxLaw.GasolineTaxRate

example : gasolineTaxRate = 24_300 := by decide
example : gasolineTaxRate > 0 := by decide
example : gasolineTaxRate ≠ 2_430 := by decide
example : gasolineTaxRate ≠ 243_000 := by decide

end JapanTaxLaw.GasolineTaxRate
