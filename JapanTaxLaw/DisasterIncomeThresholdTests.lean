import JapanTaxLaw.DisasterIncomeThreshold
import JapanTaxLaw.DisasterIncomeThresholdSpec

/-! Regression tests for the art. 2(1) ¥5,000,000 first-band condition. -/

namespace JapanTaxLaw.DisasterIncomeThreshold

open JapanTaxLaw.TaxFinance

example : threshold = 5_000_000 := by decide
example : inFirstBand 0 = true := by decide
example : inFirstBand 4_999_999 = true := by decide
example : inFirstBand 5_000_000 = true := by decide
example : inFirstBand 5_000_001 = false := by decide
example : inFirstBand 10_000_000 = false := by decide

end JapanTaxLaw.DisasterIncomeThreshold
