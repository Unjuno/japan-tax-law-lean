import JapanTaxLaw.MonthProrationSpec

/-! Regression tests — 月数按分, boundaries and universal agreement. -/

namespace JapanTaxLaw.MonthProration

example : prorate12 12 12 = 12 := by decide
example : prorate12 12 0 = 0 := by decide
example : prorate24 120 7 = 35 := by decide
example : prorate180 1_000 12 = 66 := by decide

example : prorate12 123_456 7 = spec12 123_456 7 := agree12 123_456 7
example : prorate24 123_456 7 = spec24 123_456 7 := agree24 123_456 7
example : prorate36 123_456 7 = spec36 123_456 7 := agree36 123_456 7
example : prorate48 123_456 7 = spec48 123_456 7 := agree48 123_456 7
example : prorate60 123_456 7 = spec60 123_456 7 := agree60 123_456 7
example : prorate180 123_456 7 = spec180 123_456 7 := agree180 123_456 7
example : prorate12 100 3 ≤ prorate12 200 3 := prorate_monotone 12 100 200 3 (by decide)

end JapanTaxLaw.MonthProration
