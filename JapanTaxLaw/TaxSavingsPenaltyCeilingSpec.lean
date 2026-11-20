import JapanTaxLaw.TaxSavingsPenaltyCeiling

/-!
# TaxSavingsPenaltyCeilingSpec — independent spec for 納税貯蓄組合法 art.14

Law id: 326AC1000000145 (納税貯蓄組合法)
Revision: 326AC1000000145_20211122_503AC0000000046
Statutory article: art.14(1) — 十万円以下の過料
Normative unit: NORM|91349ec2d835e0fe4fdd63ea17f15c1ce9a98c22d91c36f03bea07410596f64e

The implementation states the ceiling as `penaltyAmount ≤ penaltyCeilingYen`.
The independent spec uses a different formulation: `penaltyAmount - penaltyCeilingYen = 0`
(truncated Nat subtraction). For Nat, `n ≤ m` iff `n - m = 0`; the kernel proves
this equivalence for ALL amounts, not a finite sample.

Boundary theorems are universal where appropriate.

Not modelled: the enumerated 各号 (who is liable), the fine-imposition procedure,
other paragraphs, 政令 details.
-/

namespace JapanTaxLaw.TaxSavingsPenaltyCeiling

open JapanTaxLaw.TaxFinance

/-- Independent spec: truncated-subtraction formulation (different from ≤). -/
def specWithinPenaltyCeiling (penaltyAmount : Money) : Prop :=
  penaltyAmount - penaltyCeilingYen = 0

/-- Correspondence for all amounts. Universal, kernel-checked. -/
theorem agree_penalty_ceiling (penaltyAmount : Money) :
    withinPenaltyCeiling penaltyAmount ↔ specWithinPenaltyCeiling penaltyAmount := by
  unfold withinPenaltyCeiling specWithinPenaltyCeiling
  exact Nat.sub_eq_zero_iff_le.symm

/-- Boundary: a fine exactly at the ceiling (¥100,000) is within it. -/
theorem at_ceiling : withinPenaltyCeiling penaltyCeilingYen := by
  unfold withinPenaltyCeiling
  exact Nat.le_refl penaltyCeilingYen

/-- Boundary: a fine one yen over the ceiling is outside it. -/
theorem one_over_fails : ¬ withinPenaltyCeiling (penaltyCeilingYen + 1) := by
  unfold withinPenaltyCeiling penaltyCeilingYen
  decide

/-- Monotonicity: a smaller fine also satisfies the ceiling. -/
theorem penalty_monotone {a b : Money} (h : withinPenaltyCeiling a) (hle : b ≤ a) :
    withinPenaltyCeiling b := by
  unfold withinPenaltyCeiling at h ⊢
  exact Nat.le_trans hle h

/-- Finite smoke check (Bool) only; `agree_penalty_ceiling` is the universal proof. -/
def checkPenaltyCeiling (amount : Money) : Bool := amount <= penaltyCeilingYen

example : checkPenaltyCeiling 0 = true := by decide
example : checkPenaltyCeiling 100_000 = true := by decide
example : checkPenaltyCeiling 100_001 = false := by decide

end JapanTaxLaw.TaxSavingsPenaltyCeiling
