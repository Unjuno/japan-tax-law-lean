import JapanTaxLaw.BondRevenueFiscalYearSpec

/-
# BondRevenueFiscalYearTests — kernel-decided boundary / agreement checks

Pinned to law 352AC0000000035 / revision 352AC0000000035_19770504_000000000000000.
Single-year attribution: revenue belongs to exactly 昭和51年度 (fy == 51).
Inputs 0/1/50/51/52 cover zero, small_input, and the just-below/at/just-above
boundary of the statutory literal 51. All examples are `by decide` / `rfl` on
concrete decidable propositions, or a theorem used as a proof of its proposition.
-/

namespace JapanTaxLaw.BondRevenueFiscalYear

/-- 定数: attributedFY = 51 (昭和五十一年度). -/
example : attributedFY = 51 := by rfl

/-- zero: 昭和0年度 → false. -/
example : belongsToAttributedFY 0 = false := by decide

/-- small_input: 昭和1年度 → false. -/
example : belongsToAttributedFY 1 = false := by decide

/-- threshold_below: 昭和50年度 (= 51 - 1) → false. -/
example : belongsToAttributedFY 50 = false := by decide

/-- threshold_at: 昭和51年度 (= 51) → true. -/
example : belongsToAttributedFY 51 = true := by decide

/-- threshold_above: 昭和52年度 (= 51 + 1) → false. -/
example : belongsToAttributedFY 52 = false := by decide

/-- 独立仕様の定数: specFY = 51. -/
example : specFY = 51 := by decide

/-- impl / spec agreement at the boundary years. -/
example : belongsToAttributedFY 0 = specBelongs 0 := by decide
example : belongsToAttributedFY 1 = specBelongs 1 := by decide
example : belongsToAttributedFY 50 = specBelongs 50 := by decide
example : belongsToAttributedFY 51 = specBelongs 51 := by decide
example : belongsToAttributedFY 52 = specBelongs 52 := by decide

/-- bridges used as proofs of their exact propositions. -/
example : attributedFY = specFY := agreeFY
example : belongsToAttributedFY 51 = specBelongs 51 := agreeBelongs 51

end JapanTaxLaw.BondRevenueFiscalYear
