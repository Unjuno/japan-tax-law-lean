import JapanTaxLaw.AviationFuelTaxRateSpec

/-!
# AviationFuelTaxRateTests — kernel-decided boundary checks for art.11

All checks are `rfl` / `by decide`, kernel-checked. The universal
correspondence theorem lives in AviationFuelTaxRateSpec.lean.
-/

namespace JapanTaxLaw.AviationFuelTaxRate

open JapanTaxLaw.TaxFinance

example : ratePerKilolitre = 26_000 := rfl
example : taxForKilolitres 0 = 0 := by decide
example : taxForKilolitres 1 = 26_000 := by decide
example : taxForKilolitres 2 = 52_000 := by decide
example : taxForKilolitres 3 = 78_000 := by decide
example : taxForKilolitres 100 = 2_600_000 := by decide
example : agreeAviationFuelTax = true := by decide

end JapanTaxLaw.AviationFuelTaxRate
