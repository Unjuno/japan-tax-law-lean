import JapanTaxLaw.DisasterTaxReductionSpec

/-! Regression tests — 災害減免 3 bands, boundaries and universal agreement. -/

namespace JapanTaxLaw.DisasterTaxReduction

example : reductionAmount 1_000_001 5_000_000 = 1_000_001 := by decide
example : reductionAmount 1_000_001 5_000_001 = 500_000 := by decide
example : reductionAmount 1_000_001 7_500_001 = 250_000 := by decide

example : reductionAmount 999_999 7_500_000 = specReductionAmount 999_999 7_500_000 :=
  agreeReduction 999_999 7_500_000
example : reductionAmount 1_000_001 7_500_001 = specReductionAmount 1_000_001 7_500_001 :=
  agreeReduction 1_000_001 7_500_001

end JapanTaxLaw.DisasterTaxReduction
