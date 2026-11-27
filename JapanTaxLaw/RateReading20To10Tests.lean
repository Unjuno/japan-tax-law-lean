import JapanTaxLaw.RateReading20To10

/-! # RateReading20To10 tests — 20→10 置換 (law 332AC0000000026 / art.37の3) -/

namespace JapanTaxLaw.RateReading20To10

example : readRate 0 = 0 := by decide
example : readRate 9 = 9 := by decide
example : readRate 10 = 10 := by decide
example : readRate 11 = 11 := by decide
example : readRate 19 = 19 := by decide
example : readRate 20 = 10 := by decide
example : readRate 21 = 21 := by decide
example : readRate 100 = 100 := by decide

end JapanTaxLaw.RateReading20To10
