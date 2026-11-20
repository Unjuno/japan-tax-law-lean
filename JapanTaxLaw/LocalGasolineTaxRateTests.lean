import JapanTaxLaw.LocalGasolineTaxRateSpec

/-!
# LocalGasolineTaxRateTests — kernel-decided boundary checks for art.4

All checks are `rfl` / `by decide`, kernel-checked. The universal
correspondence theorem lives in LocalGasolineTaxRateSpec.lean.
-/

namespace JapanTaxLaw.LocalGasolineTaxRate

open JapanTaxLaw.TaxFinance

example : ratePerKilolitre = 4_400 := rfl
example : taxForKilolitres 0 = 0 := by decide
example : taxForKilolitres 1 = 4_400 := by decide
example : taxForKilolitres 2 = 8_800 := by decide
example : taxForKilolitres 3 = 13_200 := by decide
example : taxForKilolitres 100 = 440_000 := by decide
example : agreeLocalGasolineTax = true := by decide

end JapanTaxLaw.LocalGasolineTaxRate
