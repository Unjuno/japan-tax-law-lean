import JapanTaxLaw.HalfUpRoundingSpec

/-! Regression tests — 四捨五入 half boundary and universal agreement. -/

namespace JapanTaxLaw.HalfUpRounding

example : roundHalfUpThousand 499 = 0 := by decide
example : roundHalfUpThousand 500 = 1_000 := by decide
example : roundHalfUpThousand 999_500 = 1_000_000 := by decide
example : roundHalfUpMillion 499_999 = 0 := by decide
example : roundHalfUpMillion 500_000 = 1_000_000 := by decide

example : roundHalfUpThousand 1_500 = specThousand 1_500 := thousand_agrees 1_500
example : roundHalfUpThousand 1_499 = specThousand 1_499 := thousand_agrees 1_499
example : roundHalfUpMillion 1_500_000 = specMillion 1_500_000 := million_agrees 1_500_000

end JapanTaxLaw.HalfUpRounding
