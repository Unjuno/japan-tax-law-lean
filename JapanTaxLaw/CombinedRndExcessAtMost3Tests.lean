import JapanTaxLaw.CombinedRndExcessAtMost3

/-! # CombinedRndExcessAtMost3 tests — 3%境界 (law 332AC0000000026 / art.42の4) -/

namespace JapanTaxLaw.CombinedRndExcessAtMost3

example : atMost3 0 = true := by decide
example : atMost3 2 = true := by decide
example : atMost3 3 = true := by decide
example : atMost3 4 = false := by decide
example : atMost3 12 = false := by decide
example : atMost3 100 = false := by decide

end JapanTaxLaw.CombinedRndExcessAtMost3
