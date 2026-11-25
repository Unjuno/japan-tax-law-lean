import JapanTaxLaw.FloorRoundingMinimumSpec

/-! Regression tests — 切捨て boundaries, minimum rule, universal agreement. -/

namespace JapanTaxLaw.FloorRoundingMinimum

example : floorAt 99 100 = 0 := by decide
example : floorAt 100 100 = 100 := by decide
example : floorOrMinimum 99 100 100 = 100 := by decide
example : floorOrMinimum 1_499 1000 100 = 1000 := by decide
example : floorAt 7_499 500 = 7_000 := by decide
example : floorAt 15_999 10_000 = 10_000 := by decide

example : floorAt 1_499 1000 = specFloorAt 1_499 1000 := floorAt_agrees 1_499 1000 (by decide)
example : floorOrMinimum 99 100 100 = specFloorOrMinimum 99 100 100 :=
  floorOrMinimum_agrees 99 100 100 (by decide)
example : floorAt 1_000 1000 ≤ floorAt 2_000 1000 :=
  floorAt_monotone 1000 1_000 2_000 (by decide)

end JapanTaxLaw.FloorRoundingMinimum
