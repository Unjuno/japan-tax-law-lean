import JapanTaxLaw.SCFVPenaltyCeilingSpec

/-
# SCFVPenaltyCeilingTests — kernel-decided boundary checks for art.11(3)

All closed checks are Nat/Bool expressions discharged by `by decide`; the
universal impl/spec bridges are kernel-checked theorems (omega). Coverage:
zero, small positives, both ceiling boundaries (一年 = 1 年 over 2 年,
五十万円 = 500,000 円 over 499,999 / 500,001 円), cross-axis separation
(年 vs 円 are never mixed), and saturation identities.
-/

namespace JapanTaxLaw.SCFVPenaltyCeiling

-- zero input lies within both ceilings (each on its own axis)
example : withinImprisonmentCeiling 0 = true := by decide
example : withinFineCeiling 0 = true := by decide
example : specWithinImprisonment 0 = true := by decide
example : specWithinFine 0 = true := by decide

-- small positive inputs
example : withinImprisonmentCeiling 1 = true := by decide
example : withinImprisonmentCeiling 2 = false := by decide
example : withinFineCeiling 1 = true := by decide

-- imprisonment axis boundaries: 一年 = 1 年 inclusive, 2 年 over
example : withinImprisonmentCeiling 1 = true := by decide
example : withinImprisonmentCeiling 2 = false := by decide
example : specWithinImprisonment 1 = true := by decide
example : specWithinImprisonment 2 = false := by decide

-- fine axis boundaries: 五十万円 = 500,000 円 inclusive, 500,001 円 over
example : withinFineCeiling 499_999 = true := by decide
example : withinFineCeiling 500_000 = true := by decide
example : withinFineCeiling 500_001 = false := by decide
example : specWithinFine 499_999 = true := by decide
example : specWithinFine 500_000 = true := by decide
example : specWithinFine 500_001 = false := by decide

-- cross-axis separation: a valid year count with an invalid yen count,
-- and an invalid year count with a valid yen count (units never mixed)
example : withinImprisonmentCeiling 1 = true ∧ withinFineCeiling 500_001 = false := by decide
example : withinImprisonmentCeiling 2 = false ∧ withinFineCeiling 500_000 = true := by decide

-- the pinned constants, on both sides
example : imprisonmentCeilingYears = 1 := by decide
example : fineCeilingYen = 500_000 := by decide
example : specImprisonmentCeiling = 1 := by decide
example : specFineCeiling = 500_000 := by decide

-- impl/spec agreement at the boundaries
example : withinImprisonmentCeiling 1 = specWithinImprisonment 1 := by decide
example : withinImprisonmentCeiling 2 = specWithinImprisonment 2 := by decide
example : withinFineCeiling 500_000 = specWithinFine 500_000 := by decide
example : withinFineCeiling 500_001 = specWithinFine 500_001 := by decide

-- universal agreement (kernel-checked, not a finite sample)
example (years : Nat) : withinImprisonmentCeiling years = specWithinImprisonment years := by
  exact agree_imprisonment_ceiling years
example (yen : Nat) : withinFineCeiling yen = specWithinFine yen := by
  exact agree_fine_ceiling yen

-- monotonicity, via the omega-backed implementation theorems
example : withinImprisonmentCeiling 1 = true :=
  imprisonment_monotone imprisonment_at_ceiling (by decide)
example : withinFineCeiling 499_999 = true :=
  fine_monotone fine_at_ceiling (by decide)

-- saturation / Nat identity boundaries
example : 1 + 0 = 1 := by decide
example : 500_000 - 0 = 500_000 := by decide
example : 1 - 2 = 0 := by decide

end JapanTaxLaw.SCFVPenaltyCeiling
