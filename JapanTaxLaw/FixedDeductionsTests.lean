import JapanTaxLaw.FixedDeductionsSpec

/-! Regression tests — fixed-deduction boundaries and universal agreement. -/

namespace JapanTaxLaw.FixedDeductions

example : fixedDeduction 600_000 600_000 = 0 := by decide
example : fixedDeduction 600_001 600_000 = 1 := by decide
example : fixedDeduction 0 1 = 0 := by decide

example : fixedDeduction 1_234_567 600_000 = specFixedDeduction 1_234_567 600_000 :=
  fixedDeduction_agrees 1_234_567 600_000
example : fixedDeduction 2_000 2_000 = specFixedDeduction 2_000 2_000 :=
  fixedDeduction_agrees 2_000 2_000

end JapanTaxLaw.FixedDeductions
