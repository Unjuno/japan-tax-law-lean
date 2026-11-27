import JapanTaxLaw.TaxAccountantMissingPeriod2Y

/-! # TaxAccountantMissingPeriod2Y tests — 2年境界 (law 326AC1000000237 / art.25) -/

namespace JapanTaxLaw.TaxAccountantMissingPeriod2Y

example : atLeast2 0 = false := by decide
example : atLeast2 1 = false := by decide
example : atLeast2 2 = true := by decide
example : atLeast2 3 = true := by decide
example : atLeast2 12 = true := by decide

end JapanTaxLaw.TaxAccountantMissingPeriod2Y
