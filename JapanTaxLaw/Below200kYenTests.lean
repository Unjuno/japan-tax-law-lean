import JapanTaxLaw.Below200kYen

/-! # Below200kYen tests — 20万円境界 (law 340CO0000000096 / art.182の2) -/

namespace JapanTaxLaw.Below200kYen

example : below 0 = true := by decide
example : below 1 = true := by decide
example : below 199_998 = true := by decide
example : below 199_999 = true := by decide
example : below 200_000 = false := by decide
example : below 200_001 = false := by decide

end JapanTaxLaw.Below200kYen
