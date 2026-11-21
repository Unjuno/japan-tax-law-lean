import JapanTaxLaw.RefundFineRange1MSpec

/-
# RefundFineRange1M tests — 輸入品に対する内国消費税の徴収等に関する法律 第二十三条 smoke checks

All checks are closed Nat/Bool expressions discharged by `rfl` or `by decide`,
or applications of the universal agreement theorems. Pinned to law
330AC0000000037 / revision 330AC0000000037_20260401_508AC0000000012.

Coverage: zero, small positive inputs, the tax 333,333 / 333,334 threshold
(3 * tax crosses 1,000,000), fine 1,000,000 (strict 「超え」 lower bound, excluded),
fine 1,000,001 (just above, included), fine = fineUpper (inclusive 「以下」,
included), over-cap, and impl/spec agreement at boundary points and universally.
-/

namespace JapanTaxLaw.RefundFineRange1M

-- (a) pinned statutory values.
example : fineFloor = 1_000_000 := rfl
example : specFloor = 1_000_000 := rfl
example : specMult = 3 := rfl

-- (b) zero + saturation identity.
example : fineUpper 0 = 0 := by decide
example : rangeApplies 0 = false := by decide
example : fineWithinRange 0 0 = false := by decide

-- (c) small positive inputs.
example : fineUpper 1 = 3 := by decide
example : rangeApplies 1 = false := by decide
example : fineWithinRange 1 1 = false := by decide

-- (d) tax just below threshold: 3 * 333,333 = 999,999 ≤ 1,000,000 → no range.
example : fineUpper 333_333 = 999_999 := by decide
example : rangeApplies 333_333 = false := by decide

-- (e) tax at threshold: 3 * 333,334 = 1,000,002 > 1,000,000 → range applies.
example : fineUpper 333_334 = 1_000_002 := by decide
example : rangeApplies 333_334 = true := by decide

-- (f) 「百万円を超え」は strict: 1,000,000 は範囲外。
example : fineWithinRange 1_000_000 333_334 = false := by decide
-- just below the floor is also excluded.
example : fineWithinRange 999_999 333_334 = false := by decide
-- one yen above the floor is included.
example : fineWithinRange 1_000_001 333_334 = true := by decide
-- (g) 「三倍以下」は inclusive: 上限 (fineUpper) 自体は範囲内。
example : fineWithinRange (fineUpper 333_334) 333_334 = true := by decide
-- (h) over-cap: 上限超過は範囲外。
example : fineWithinRange 1_000_003 333_334 = false := by decide

-- (i) universal boundary check (kernel-checked, not a finite sample).
example (tax : Nat) : fineWithinRange (fineUpper tax) tax = (fineFloor < fineUpper tax) := by
  unfold fineWithinRange fineFloor fineUpper
  simp

-- (j) impl/spec agreement at boundary points and universally.
example : rangeApplies 333_334 = specApplies 333_334 := by decide
example : rangeApplies 333_333 = specApplies 333_333 := by decide
example : fineWithinRange 1_000_001 333_334 = specWithin 1_000_001 333_334 := by decide
example : fineWithinRange 1_000_000 333_334 = specWithin 1_000_000 333_334 := by decide
example (tax : Nat) : rangeApplies tax = specApplies tax := agree_applies tax
example (fine tax : Nat) : fineWithinRange fine tax = specWithin fine tax := agree_within fine tax

end JapanTaxLaw.RefundFineRange1M
