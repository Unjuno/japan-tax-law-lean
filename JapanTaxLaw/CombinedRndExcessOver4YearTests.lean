import JapanTaxLaw.CombinedRndExcessOver4Year

/-! # CombinedRndExcessOver4Year tests — 4%境界 (law 332AC0000000026 / art.42の4) -/

namespace JapanTaxLaw.CombinedRndExcessOver4Year

example : exceeds4 0 = false := by decide
example : exceeds4 3 = false := by decide
example : exceeds4 4 = false := by decide
example : exceeds4 5 = true := by decide
example : exceeds4 12 = true := by decide
example : exceeds4 100 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver4Year
