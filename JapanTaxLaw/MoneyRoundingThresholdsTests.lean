import JapanTaxLaw.MoneyRoundingThresholdsSpec

/-! Regression tests — 金額端数切り捨て（一円/百円/千円未満). -/

namespace JapanTaxLaw.MoneyRoundingThresholds

example : oneYen = 1 := by decide
example : hundredYen = 100 := by decide
example : thousandYen = 1000 := by decide

example : roundDown 99 hundredYen = 0 := by decide
example : roundDown 100 hundredYen = 100 := by decide
example : roundDown 150 hundredYen = 100 := by decide
example : roundDown 1999 hundredYen = 1900 := by decide
example : roundDown 999 thousandYen = 0 := by decide
example : roundDown 1500 thousandYen = 1000 := by decide
example : roundDown 7 oneYen = 7 := by decide

example : specRounded 150 100 (roundDown 150 100) := agreeRoundDown 150 100
example : roundUp 100 100 = 100 := by decide
example : roundUp 101 100 = 200 := by decide
example : roundUp 150 100 = 200 := by decide
example : roundUp 1999 1000 = 2000 := by decide
example : specRoundedUp 150 100 (roundUp 150 100) := agreeRoundUp 150 100
example : roundDown 99 100 = 0 := belowThresholdIsZero 99 100 (by decide)

end JapanTaxLaw.MoneyRoundingThresholds
