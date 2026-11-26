import JapanTaxLaw.RateReading20To25

/-! # RateReading20To25 tests — 20→25 置換 (law 332AC0000000026 / art.37の3) -/

namespace JapanTaxLaw.RateReading20To25

example : readRate 0 = 0 := by decide
example : readRate 10 = 10 := by decide
example : readRate 19 = 19 := by decide
example : readRate 20 = 25 := by decide
example : readRate 21 = 21 := by decide
example : readRate 24 = 24 := by decide
example : readRate 25 = 25 := by decide
example : readRate 100 = 100 := by decide

end JapanTaxLaw.RateReading20To25
