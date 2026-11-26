import JapanTaxLaw.LoanBalanceRatioAtMost15

/-! # LoanBalanceRatioAtMost15 tests — 15%境界 (law 340CO0000000096 / art.73) -/

namespace JapanTaxLaw.LoanBalanceRatioAtMost15

example : atMost15 0 = true := by decide
example : atMost15 14 = true := by decide
example : atMost15 15 = true := by decide
example : atMost15 16 = false := by decide
example : atMost15 50 = false := by decide
example : atMost15 100 = false := by decide

end JapanTaxLaw.LoanBalanceRatioAtMost15
