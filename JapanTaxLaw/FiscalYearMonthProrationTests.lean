import JapanTaxLaw.FiscalYearMonthProrationSpec

/-
# FiscalYearMonthProrationTests — kernel-decided boundary / agreement checks

Pinned to law 404AC0000000015 / revision 404AC0000000015_20010401_413AC0000000006.
Divide-then-multiply: (4,000,000 / 12) * months, floor at the division.
Months 0/1/6/11/12/13 cover zero, small_input, threshold_below/at/above
around 十二 = 12. All examples are `by decide` on concrete decidable
propositions, or a theorem used as a proof of its exact proposition.
-/

namespace JapanTaxLaw.FiscalYearMonthProration

/-- zero: 0 月 → 0 円 (also the saturating/floor boundary). -/
example : proratedFor 0 = 0 := by decide

/-- small_input: 1 月 → 333,333 円 (floor of 4,000,000 / 12). -/
example : proratedFor 1 = 333_333 := by decide

/-- small_input: 6 月 → 1,999,998 円. -/
example : proratedFor 6 = 1_999_998 := by decide

/-- threshold_below: 11 月 (= 十二 - 1) → 3,666,663 円. -/
example : proratedFor 11 = 3_666_663 := by decide

/-- threshold_at: 12 月 (= 十二) → 3,999,996 円 (literal order, floor). -/
example : proratedFor 12 = 3_999_996 := by decide

/-- threshold_above: 13 月 (= 十二 + 1) → 4,333,329 円. -/
example : proratedFor 13 = 4_333_329 := by decide

/-- constant values. -/
example : annualAmount = 4_000_000 := by decide
example : monthsPerYear = 12 := by decide
example : specAnnual = 4_000_000 := by decide
example : specMonths = 12 := by decide

/-- impl / spec agreement at the boundary months. -/
example : proratedFor 0 = specProrated 0 := by decide
example : proratedFor 1 = specProrated 1 := by decide
example : proratedFor 6 = specProrated 6 := by decide
example : proratedFor 11 = specProrated 11 := by decide
example : proratedFor 12 = specProrated 12 := by decide
example : proratedFor 13 = specProrated 13 := by decide

/-- bridges used as proofs of their exact propositions. -/
example : annualAmount = specAnnual := agreeAnnual
example : monthsPerYear = specMonths := agreeMonths
example : proratedFor 12 = specProrated 12 := agreeProrated 12

end JapanTaxLaw.FiscalYearMonthProration
