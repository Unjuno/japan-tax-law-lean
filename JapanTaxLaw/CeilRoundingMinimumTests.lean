import JapanTaxLaw.CeilRoundingMinimumSpec

/-! Regression tests — 切り上げ boundaries and universal agreement. -/

namespace JapanTaxLaw.CeilRoundingMinimum

example : ceilOrMinimum 0 100 = 100 := by decide
example : ceilOrMinimum 1 100 = 100 := by decide
example : ceilOrMinimum 101 100 = 200 := by decide
example : ceilOrMinimum 1_001 1000 = 2000 := by decide

example : ceilOrMinimum 99 100 = specCeilOrMinimum 99 100 :=
  agreeCeilOrMinimum 99 100 (by decide)
example : ceilOrMinimum 101 100 = specCeilOrMinimum 101 100 :=
  agreeCeilOrMinimum 101 100 (by decide)
example : ceilOrMinimum 1_001 1000 = specCeilOrMinimum 1_001 1000 :=
  agreeCeilOrMinimum 1_001 1000 (by decide)

end JapanTaxLaw.CeilRoundingMinimum
