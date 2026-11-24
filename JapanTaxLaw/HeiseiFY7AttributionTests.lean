import JapanTaxLaw.HeiseiFY7AttributionSpec

/-
# HeiseiFY7AttributionTests — kernel-decided boundary / agreement checks

Pinned to law 408AC0000000002 / revision 408AC0000000002_19960223_000000000000000.
Single-year attribution: revenue belongs to exactly 平成7年度 (fy == 7).
Inputs 0/6/7/8 cover zero, small_input, and the just-below / at / just-above
boundary of the statutory literal 7 (平成七年度). All examples are `by decide`
or `rfl` on concrete decidable propositions, or a theorem used as a proof of
its exact proposition.
-/

namespace JapanTaxLaw.HeiseiFY7Attribution

/-- 定数: attributedFY = 7 (平成七年度). -/
example : attributedFY = 7 := by rfl

/-- zero: 平成0年度 → false. -/
example : belongsToAttributedFY 0 = false := by decide

/-- threshold_below: 平成6年度 (= 7 - 1) → false. -/
example : belongsToAttributedFY 6 = false := by decide

/-- threshold_at: 平成7年度 (= 7) → true. -/
example : belongsToAttributedFY 7 = true := by decide

/-- threshold_above: 平成8年度 (= 7 + 1) → false. -/
example : belongsToAttributedFY 8 = false := by decide

/-- 独立仕様の定数: specFY = 7. -/
example : specFY = 7 := by decide

/-- impl / spec agreement at the boundary years. -/
example : belongsToAttributedFY 0 = specBelongs 0 := by decide
example : belongsToAttributedFY 6 = specBelongs 6 := by decide
example : belongsToAttributedFY 7 = specBelongs 7 := by decide
example : belongsToAttributedFY 8 = specBelongs 8 := by decide

/-- bridges used as proofs of their exact propositions. -/
example : attributedFY = specFY := agreeFY
example : belongsToAttributedFY 7 = specBelongs 7 := agreeBelongs 7

end JapanTaxLaw.HeiseiFY7Attribution
