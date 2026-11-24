import JapanTaxLaw.HeiseiFY6AttributionSpec

/-
# HeiseiFY6AttributionTests — kernel-decided boundary / agreement checks

Pinned to law 406AC0000000108 / revision 406AC0000000108_20070401_419AC0000000023.
Single-year attribution: revenue belongs to exactly 平成6年度 (fy == 6).
Inputs 0/5/6/7 cover zero, small_input, and the just-below/at/just-above
boundary of the statutory literal 6. All examples are `by decide` / `rfl` on
concrete decidable propositions, or a theorem used as a proof of its proposition.
-/

namespace JapanTaxLaw.HeiseiFY6Attribution

/-- 定数: attributedFY = 6 (平成六年度). -/
example : attributedFY = 6 := by rfl

/-- zero: 平成0年度 → false. -/
example : belongsToAttributedFY 0 = false := by decide

/-- threshold_below: 平成5年度 (= 6 - 1) → false. -/
example : belongsToAttributedFY 5 = false := by decide

/-- threshold_at: 平成6年度 (= 6) → true. -/
example : belongsToAttributedFY 6 = true := by decide

/-- threshold_above: 平成7年度 (= 6 + 1) → false. -/
example : belongsToAttributedFY 7 = false := by decide

/-- 独立仕様の定数: specFY = 6. -/
example : specFY = 6 := by decide

/-- impl / spec agreement at the boundary years. -/
example : belongsToAttributedFY 0 = specBelongs 0 := by decide
example : belongsToAttributedFY 5 = specBelongs 5 := by decide
example : belongsToAttributedFY 6 = specBelongs 6 := by decide
example : belongsToAttributedFY 7 = specBelongs 7 := by decide

/-- bridges used as proofs of their exact propositions. -/
example : attributedFY = specFY := agreeFY
example : belongsToAttributedFY 6 = specBelongs 6 := agreeBelongs 6

end JapanTaxLaw.HeiseiFY6Attribution
