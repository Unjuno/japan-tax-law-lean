import JapanTaxLaw.ProgressiveSurchargeBracketsSpec

/-! Regression tests — 3-bracket table, boundaries, and universal agreement. -/

namespace JapanTaxLaw.ProgressiveSurchargeBrackets

example : progressiveSurcharge 505_000 = 75_000 + 1_000 := by decide
example : progressiveSurcharge 3_001_000 = 75_000 + 500_000 + 300 := by decide
example : progressiveSurcharge 10_000_000 = 75_000 + 500_000 + 2_100_000 := by decide

example : progressiveSurcharge 3_000_000 = specSurcharge 3_000_000 :=
  agreeSurcharge 3_000_000
example : withAdditional 4_000_000 1_000_000 = specWithAdditional 4_000_000 1_000_000 :=
  agreeWithAdditional 4_000_000 1_000_000
example : slice 1_000_000 500_000 3_000_000 = 500_000 := by decide

end JapanTaxLaw.ProgressiveSurchargeBrackets
