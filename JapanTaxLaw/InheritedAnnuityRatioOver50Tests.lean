import JapanTaxLaw.InheritedAnnuityRatioOver50

/-! # InheritedAnnuityRatioOver50 tests — 50%境界 (law 340CO0000000096 / art.185) -/

namespace JapanTaxLaw.InheritedAnnuityRatioOver50

example : over50 0 = false := by decide
example : over50 49 = false := by decide
example : over50 50 = false := by decide
example : over50 51 = true := by decide
example : over50 100 = true := by decide

end JapanTaxLaw.InheritedAnnuityRatioOver50
