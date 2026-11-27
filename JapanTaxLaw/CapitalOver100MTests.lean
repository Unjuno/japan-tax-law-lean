import JapanTaxLaw.CapitalOver100M

/-! # tests — 1億円境界 (law 332AC0000000026 / art.61の4) -/

namespace JapanTaxLaw.CapitalOver100M

example : over100M 0 = false := by decide
example : over100M 99_999_999 = false := by decide
example : over100M 100_000_000 = false := by decide
example : over100M 100_000_001 = true := by decide
example : thresholdYen = 100_000_000 := by decide

end JapanTaxLaw.CapitalOver100M
