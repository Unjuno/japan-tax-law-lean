import JapanTaxLaw.ContinuingIncreaseAtLeast5

/-! # ContinuingIncreaseAtLeast5 tests — 5%境界 (law 332AC0000000026 / art.10の5の4) -/

namespace JapanTaxLaw.ContinuingIncreaseAtLeast5

example : atLeast5 0 = false := by decide
example : atLeast5 4 = false := by decide
example : atLeast5 5 = true := by decide
example : atLeast5 6 = true := by decide
example : atLeast5 15 = true := by decide
example : atLeast5 100 = true := by decide

end JapanTaxLaw.ContinuingIncreaseAtLeast5
