import JapanTaxLaw.PerPersonDeductionSpec

/-! Regression tests — 一人当たり加算, generic identity and boundaries. -/

namespace JapanTaxLaw.PerPersonDeduction

example : perPersonDeduction 10_000 0 10_000 = 10_000 := by decide
example : perPersonDeduction 10_000 1 10_000 = 20_000 := by decide
example : perPersonDeduction 50_000 2 50_000 = 150_000 := by decide

example : perPersonDeduction 10_000 5 10_000 = (5 + 1) * 10_000 := base_eq_amount 5 10_000
example : perPersonDeduction 30_000 2 30_000 = 2 * 30_000 + 30_000 := commute 30_000 2 30_000
example : perPersonDeduction 10_000 1 10_000 ≤ perPersonDeduction 10_000 3 10_000 :=
  monotone_count 10_000 10_000 1 3 (by decide)

end JapanTaxLaw.PerPersonDeduction
