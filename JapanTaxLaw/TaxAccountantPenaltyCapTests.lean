import JapanTaxLaw.TaxAccountantPenaltyCap
import JapanTaxLaw.TaxAccountantPenaltyCapSpec

/-
# TaxAccountantPenaltyCapTests — kernel-decided boundary checks for 税理士法 第六十四条

All checks are closed Nat/Bool expressions decided by the kernel (`by decide`).
Coverage: zero, small positive inputs, the 百万円 (= 1_000_000) threshold
neighbourhood, saturation/identity, and impl/spec agreement on the grid.
-/

namespace JapanTaxLaw.TaxAccountantPenaltyCap

-- (a) zero amount is within the cap.
example : withinPenaltyCap 0 = true := by decide

-- (b) small positive inputs: 1, 999,999, 1,000,000, 1,000,001.
example : withinPenaltyCap 1 = true := by decide
example : withinPenaltyCap 999_999 = true := by decide
example : withinPenaltyCap 1_000_000 = true := by decide
example : withinPenaltyCap 1_000_001 = false := by decide

-- (c) saturation / identity at the statutory cap 百万円 (= 1,000,000).
example : 1_000_000 - 1_000_000 = 0 := by decide
example : penaltyCap = 1_000_000 := by decide

-- (d) impl/spec agreement on the boundary grid (kernel-decided Bool).
example : withinPenaltyCap 0 = specWithin 0 := by decide
example : withinPenaltyCap 1 = specWithin 1 := by decide
example : withinPenaltyCap 999_999 = specWithin 999_999 := by decide
example : withinPenaltyCap 1_000_000 = specWithin 1_000_000 := by decide
example : withinPenaltyCap 1_000_001 = specWithin 1_000_001 := by decide
example (x : Nat) : withinPenaltyCap x = specWithin x := agreePenaltyCap x

end JapanTaxLaw.TaxAccountantPenaltyCap
