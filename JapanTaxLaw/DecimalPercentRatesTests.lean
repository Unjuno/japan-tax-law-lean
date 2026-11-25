import JapanTaxLaw.DecimalPercentRatesSpec

/-! Regression tests — 小数税率, boundaries, and universal agreement. -/

namespace JapanTaxLaw.DecimalPercentRates

example : deduct135 1 = 0 := by decide
example : deduct135 7_407 = 99 := by decide
example : rate4085 247 = 100 := by decide
example : rate4465 247 = 110 := by decide
example : rate624 16 = 0 := by decide
example : rate624 625 = 39 := by decide
example : rate14 143 = 2 := by decide

example : deduct135 7_407 = spec135 7_407 := deduction135_agrees 7_407
example : rate4085 247 = spec4085 247 := rate4085_agrees 247
example : rate4465 247 = spec4465 247 := rate4465_agrees 247
example : rate624 625 = spec624 625 := rate624_agrees 625
example : rate14 143 = spec14 143 := rate14_agrees 143

end JapanTaxLaw.DecimalPercentRates
