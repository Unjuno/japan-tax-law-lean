import JapanTaxLaw.LifePremiumDeductionSpec

/-! Regression tests — 2万/4万/8万 band boundaries and universal agreement. -/

namespace JapanTaxLaw.LifePremiumDeduction

example : deduction 19_999 = 19_999 := by decide
example : deduction 30_000 = 25_000 := by decide
example : deduction 60_000 = 35_000 := by decide
example : deduction 100_000 = 40_000 := by decide

example : deduction 30_000 = specDeduction 30_000 := agreeDeduction 30_000
example : deduction 60_000 = specDeduction 60_000 := agreeDeduction 60_000
example : deduction 80_001 = specDeduction 80_001 := agreeDeduction 80_001

end JapanTaxLaw.LifePremiumDeduction
