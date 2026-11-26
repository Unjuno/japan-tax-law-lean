import JapanTaxLaw.InheritedAnnuityRatioAtMost50

/-! # InheritedAnnuityRatioAtMost50 tests — 50%境界 (law 340CO0000000096 / art.185) -/

namespace JapanTaxLaw.InheritedAnnuityRatioAtMost50

example : atMost50 0 = true := by decide
example : atMost50 49 = true := by decide
example : atMost50 50 = true := by decide
example : atMost50 51 = false := by decide
example : atMost50 100 = false := by decide

end JapanTaxLaw.InheritedAnnuityRatioAtMost50
