import JapanTaxLaw.TobaccoRatePerThousandSpec

/-
# TobaccoRatePerThousandTests — kernel-decided boundary / agreement checks

Pinned to law 359AC0000000072 / revision 359AC0000000072_20260525_506AC0000000052.
Rate 6802 円 per 1000 本; counts 0/1/999/1000/1001/2000. All examples are
`by decide` on concrete decidable propositions; no classical choice, no
tactics beyond decide/rfl.
-/

namespace JapanTaxLaw.TobaccoRatePerThousand

/-- zero: 0 本 → 0 円. -/
example : taxFor 0 = 0 := by decide

/-- small_input: 1 本 → 6 円 (floor of 6802/1000). -/
example : taxFor 1 = 6 := by decide

/-- small_input: 2 本 → 13 円 (floor of 13604/1000). -/
example : taxFor 2 = 13 := by decide

/-- threshold_below: 999 本 (= 1000-1) → 6795 円 (floor). -/
example : taxFor 999 = 6795 := by decide

/-- threshold_at: 1000 本 (= 千本) → 6802 円 (exact). -/
example : taxFor 1000 = 6802 := by decide

/-- threshold_above: 1001 本 (= 1000+1) → 6808 円 (floor). -/
example : taxFor 1001 = 6808 := by decide

/-- exact multiple: 2000 本 → 13604 円 (exact). -/
example : taxFor 2000 = 13604 := by decide

/-- constant values. -/
example : ratePerThousand = 6802 := by decide
example : unitCount = 1000 := by decide
example : specRate = 6802 := by decide
example : specUnit = 1000 := by decide

/-- impl / spec agreement at the boundary counts. -/
example : taxFor 0 = specTax 0 := by decide
example : taxFor 1 = specTax 1 := by decide
example : taxFor 999 = specTax 999 := by decide
example : taxFor 1000 = specTax 1000 := by decide
example : taxFor 1001 = specTax 1001 := by decide
example : taxFor 2000 = specTax 2000 := by decide

/-- bridges used as proofs of their exact propositions. -/
example : ratePerThousand = specRate := agreeRate
example : unitCount = specUnit := agreeUnit
example : taxFor 1000 = specTax 1000 := agreeTax 1000

end JapanTaxLaw.TobaccoRatePerThousand
