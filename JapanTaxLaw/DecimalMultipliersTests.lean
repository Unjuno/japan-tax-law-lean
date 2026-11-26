import JapanTaxLaw.DecimalMultipliersSpec

/-! Regression tests — decimal multiplier boundaries and universal agreement. -/

namespace JapanTaxLaw.DecimalMultipliers

example : scaledAmount 0 15 10 = 0 := by decide
example : scaledAmount 1 15 10 = 1 := by decide
example : scaledAmount 1_000 1_050 1_000 = 1_050 := by decide

example : scaledAmount 123_456 15 10 = specScaled 123_456 15 10 := agrees 123_456 15 10 (by decide)
example : scaledAmount 123_456 95 100 = specScaled 123_456 95 100 := agrees 123_456 95 100 (by decide)
example : scaledAmount 123_456 475 1000 = specScaled 123_456 475 1000 := agrees 123_456 475 1000 (by decide)

end JapanTaxLaw.DecimalMultipliers
