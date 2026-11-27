import JapanTaxLaw.SpecialMeasuresBracket50To80M

/-! # SpecialMeasuresBracket50To80M tests — 5000万/8000万境界 (law 332AC0000000026 / art.87) -/

namespace JapanTaxLaw.SpecialMeasuresBracket50To80M

example : inRange 0 = false := by decide
example : inRange 49_999_999 = false := by decide
example : inRange 50_000_000 = false := by decide
example : inRange 50_000_001 = true := by decide
example : inRange 79_999_999 = true := by decide
example : inRange 80_000_000 = true := by decide
example : inRange 80_000_001 = false := by decide

end JapanTaxLaw.SpecialMeasuresBracket50To80M
