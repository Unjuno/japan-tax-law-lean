import JapanTaxLaw.ExtraDepreciationBelow10

/-! # ExtraDepreciationBelow10 tests — 10%境界 (law 340CO0000000096 / art.133) -/

namespace JapanTaxLaw.ExtraDepreciationBelow10

example : below10 0 = true := by decide
example : below10 9 = true := by decide
example : below10 10 = false := by decide
example : below10 11 = false := by decide
example : below10 50 = false := by decide
example : below10 100 = false := by decide

end JapanTaxLaw.ExtraDepreciationBelow10
