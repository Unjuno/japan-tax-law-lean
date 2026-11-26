import JapanTaxLaw.CombinedRndExcessOver7Year

/-! # CombinedRndExcessOver7Year tests — 7%境界 (law 332AC0000000026 / art.42の4) -/

namespace JapanTaxLaw.CombinedRndExcessOver7Year

example : exceeds7 0 = false := by decide
example : exceeds7 3 = false := by decide
example : exceeds7 6 = false := by decide
example : exceeds7 7 = false := by decide
example : exceeds7 8 = true := by decide
example : exceeds7 12 = true := by decide
example : exceeds7 100 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver7Year
