import JapanTaxLaw.CombinedRndExcessOver3

/-! # CombinedRndExcessOver3 tests — 3%境界 (law 332AC0000000026 / art.42の4) -/

namespace JapanTaxLaw.CombinedRndExcessOver3

example : exceeds3 0 = false := by decide
example : exceeds3 2 = false := by decide
example : exceeds3 3 = false := by decide
example : exceeds3 4 = true := by decide
example : exceeds3 12 = true := by decide
example : exceeds3 100 = true := by decide

end JapanTaxLaw.CombinedRndExcessOver3
