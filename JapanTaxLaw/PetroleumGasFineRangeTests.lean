/-
# PetroleumGasFineRange tests — 石油ガス税法 art.27 smoke checks

Decidable smoke tests pinned to law 340AC0000000156 / revision
340AC0000000156_20260525_506AC0000000052. All inputs/results are Nat/Bool.

Coverage: zero, small positive inputs, the tax=166,666 / 166,667 threshold,
fine=500,000 (strict 「超え」 lower bound, excluded), fine=500,001 (just above,
included), fine=fineUpper (inclusive 「以下」, included), over-cap, and
kernel-decided impl/spec agreement.
-/

import JapanTaxLaw.PetroleumGasFineRange
import JapanTaxLaw.PetroleumGasFineRangeSpec

namespace JapanTaxLaw.PetroleumGasFineRange

-- zero + saturated/multiple identity
example : fineUpper 0 = 0 := by decide
example : rangeApplies 0 = false := by decide
example : fineWithinRange 0 0 = false := by decide

-- small positive inputs
example : fineUpper 1 = 3 := by decide
example : fineUpper 2 = 6 := by decide
example : rangeApplies 1 = false := by decide
example : fineWithinRange 1 1 = false := by decide

-- threshold: 3 * 166,666 = 499,998 ≤ 500,000 → 範囲は適用されない
example : fineUpper 166_666 = 499_998 := by decide
example : rangeApplies 166_666 = false := by decide
example : fineWithinRange 500_001 166_666 = false := by decide

-- threshold: 3 * 166,667 = 500,001 > 500,000 → 範囲適用
example : fineUpper 166_667 = 500_001 := by decide
example : rangeApplies 166_667 = true := by decide

-- 「五十万円を超え」は strict: 500,000 は範囲外
example : fineWithinRange 500_000 166_667 = false := by decide
-- その直前の 500,001 は範囲内
example : fineWithinRange 500_001 166_667 = true := by decide
-- 「三倍以下」は inclusive: 上限(fineUpper) 自体は範囲内
example : fineWithinRange (fineUpper 166_667) 166_667 = true := by decide
-- over-cap: 上限超過は範囲外
example : fineWithinRange 500_002 166_667 = false := by decide

-- impl/spec agreement (kernel-decided)
example : rangeApplies 166_667 = specApplies 166_667 := by decide
example : fineWithinRange 500_000 166_667 = specWithin 500_000 166_667 := by decide
example : fineWithinRange 500_001 166_667 = specWithin 500_001 166_667 := by decide

-- universal boundary check (kernel-checked, not a finite sample)
example (tax : Nat) : fineWithinRange (fineUpper tax) tax = decide (fineFloor < fineUpper tax) := by
  unfold fineWithinRange fineFloor fineUpper
  simp

end JapanTaxLaw.PetroleumGasFineRange
