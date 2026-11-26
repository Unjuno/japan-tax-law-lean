import JapanTaxLaw.UnusedDeductionSpec

/-! Regression tests — deduction boundary cases and universal agreement. -/

namespace JapanTaxLaw.UnusedDeduction

example : undeducted 500 200 = 300 := by decide
example : undeducted 500 500 = 0 := by decide
example : undeducted 500 700 = 0 := by decide

example : undeducted 100 40 = specUndeducted 100 40 := undeducted_agrees 100 40
example : undeducted 100 140 = specUndeducted 100 140 := undeducted_agrees 100 140

end JapanTaxLaw.UnusedDeduction
