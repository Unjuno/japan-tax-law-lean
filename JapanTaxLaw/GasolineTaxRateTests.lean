import JapanTaxLaw.GasolineTaxRateSpec

/-!
# GasolineTaxRateTests — kernel-decided boundary checks for art.9

All checks are `rfl` / `by decide`, kernel-checked. The universal
correspondence theorem lives in GasolineTaxRateSpec.lean.
-/

namespace JapanTaxLaw.GasolineTaxRate

open JapanTaxLaw.TaxFinance

example : ratePerKilolitre = 24_300 := rfl
example : taxForKilolitres 0 = 0 := by decide
example : taxForKilolitres 1 = 24_300 := by decide
example : taxForKilolitres 2 = 48_600 := by decide
example : taxForKilolitres 3 = 72_900 := by decide
example : taxForKilolitres 100 = 2_430_000 := by decide
example : agreeGasolineTax = true := by decide

end JapanTaxLaw.GasolineTaxRate
