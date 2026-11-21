import JapanTaxLaw.LocalTaxDeductionSpouse

/-!
# LocalTaxDeductionSpouseSpec — independent spec for 地方税法 第二十三条(1)第八号（控除対象配偶者）

Law id: 325AC0000000226 (地方税法, Act)
Revision: 325AC0000000226_20261101_508AC0000000002
Article: 第二十三条(1)第八号 — 控除対象配偶者 (taxpayer's ¥10M income ceiling)
Normative unit: NORM|1c803e2d190195eb3ae5d4c1ebd12bfb79992ddc99b46827d139146b79c178fc

The implementation uses `income ≤ incomeCeilingYen` where `income` is the
納税義務者's prior-year total income. The independent spec reformulates via
successor-strict membership: `income < Nat.succ incomeCeilingYen` (equivalent via
`Nat.lt_succ_iff`, but a distinct formulation). Kernel proves equivalence for ALL.

Boundary theorems: 10,000,000 qualifies (以下 = inclusive); 10,000,001 fails.
Upper-bound-only (no lower bound in source).

Not modelled: defined term 控除対象配偶者, cross-ref 同一生計配偶者 (Item 7), other
items, other paragraphs and other articles.
-/

namespace JapanTaxLaw.LocalTaxDeductionSpouse

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive upper bound. -/
def specWithinIncomeRequirement (income : Money) : Prop :=
  income < Nat.succ incomeCeilingYen

/-- Correspondence for all incomes. Universal, kernel-checked, axiom-free. -/
theorem agree_income_requirement (income : Money) :
    withinIncomeRequirement income ↔ specWithinIncomeRequirement income := by
  unfold withinIncomeRequirement specWithinIncomeRequirement
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- 千万円 (10,000,000) itself qualifies (以下 is inclusive). -/
theorem at_ceiling : withinIncomeRequirement 10_000_000 := by
  unfold withinIncomeRequirement incomeCeilingYen
  decide

/-- 10,000,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinIncomeRequirement 10_000_001 := by
  unfold withinIncomeRequirement incomeCeilingYen
  decide

/-- Ceiling decoded correctly: 千万円 = 10,000,000. -/
theorem ceiling_decoded : incomeCeilingYen = 10_000_000 := rfl

end JapanTaxLaw.LocalTaxDeductionSpouse
