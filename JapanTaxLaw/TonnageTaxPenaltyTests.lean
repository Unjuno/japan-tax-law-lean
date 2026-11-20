import JapanTaxLaw.TonnageTaxPenalty

/-!
# TonnageTaxPenalty tests — 特別とん税法 art.10 smoke checks
Decidable smoke tests, pinned to law 332AC0000000038 / revision 332AC0000000038_20250601_504AC0000000068.
境界: 3年/50万円（上限内）、4年/500001円（超過）。有限領域の smoke。
-/

namespace JapanTaxLaw.TonnageTaxPenalty

example : maxImprisonmentYears = 3 := by decide
example : maxFineYen = 500_000 := by decide
example : withinLimits 0 0 = true := by decide
example : withinLimits 3 500_000 = true := by decide
example : withinLimits 4 500_000 = false := by decide
example : withinLimits 3 500_001 = false := by decide
example : withinLimits 2 250_000 = true := by decide

end JapanTaxLaw.TonnageTaxPenalty
