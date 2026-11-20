import JapanTaxLaw.TaxSavingsPenaltyCap
import JapanTaxLaw.TaxSavingsPenaltyCapSpec

/-!
# TaxSavingsPenaltyCapTests — kernel-decided boundary checks for art. 14

All examples are closed Nat/Bool expressions checked by `by decide`.
Coverage: zero input, small positive inputs (1, 100,000-1, 100,000,
100,000+1), saturation/identity at the 十万円 threshold, and impl/spec
agreement on the boundary grid.
-/

namespace JapanTaxLaw.TaxSavingsPenaltyCap

-- (a) zero input is within the cap.
example : withinPenaltyCap 0 = true := by decide

-- (b) small positive inputs: 1, 100000-1 = 99999, 100000, 100000+1 = 100001.
example : withinPenaltyCap 1 = true := by decide
example : withinPenaltyCap 99_999 = true := by decide
example : withinPenaltyCap 100_000 = true := by decide
example : withinPenaltyCap 100_001 = false := by decide

-- (c) saturation / identity at the statutory threshold 十万円 (= 100,000):
--     truncated Nat subtraction saturates to 0 at the cap.
example : 100_000 - 100_000 = 0 := by decide
example : 100_001 - 100_000 = 1 := by decide
example : penaltyCap = 100_000 := by decide

-- (d) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : agreePenaltyCap = true := by decide
example : withinPenaltyCap 100_000 = specWithin 100_000 := by decide

end JapanTaxLaw.TaxSavingsPenaltyCap
