import JapanTaxLaw.InternationalTouristTaxUnitSpec

/-!
# InternationalTouristTaxUnitTests — kernel-decided boundary checks

All checks are `by decide` / `rfl` and therefore kernel-checked, not finite
enumeration standing in for a universal claim. The universal correspondence
theorem lives in InternationalTouristTaxUnitSpec.lean.
-/

namespace JapanTaxLaw.InternationalTouristTaxUnit

open JapanTaxLaw.TaxFinance

example : ratePerDeparture = 3_000 := rfl

example : taxForDepartures 0 = 0 := by decide
example : taxForDepartures 1 = 3_000 := by decide
example : taxForDepartures 2 = 6_000 := by decide
example : taxForDepartures 3 = 9_000 := by decide
example : taxForDepartures 1_000 = 3_000_000 := by decide

example : agreeInternationalTouristTax = true := by decide

end JapanTaxLaw.InternationalTouristTaxUnit
