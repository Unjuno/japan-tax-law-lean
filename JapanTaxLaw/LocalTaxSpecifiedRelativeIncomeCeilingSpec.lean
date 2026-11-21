import JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling

/-!
# LocalTaxSpecifiedRelativeIncomeCeilingSpec — independent spec for 地方税法施行規則 第二条の三の五(3)2

Law id: 329M50000002023 (地方税法施行規則, MinisterialOrdinance)
Revision: 329M50000002023_20261101_508M60000008045
Article: 第二条の三の五(3)2 — 特定親族 total income ≤ ¥850,000
Normative unit: NORM|82fb8eb5c1e96b8c4ba285efcd8506848b999781b461e977bb759c1932819c31

The implementation uses `income ≤ incomeCeilingYen`. The independent spec uses
successor-strict membership `income < Nat.succ incomeCeilingYen` — a distinct
formulation. The kernel proves equivalence for ALL incomes, axiom-free via core
Nat lemmas (no simp/rw that would introduce propext).

Boundary theorems: 850,000 qualifies (以下 inclusive); 850,001 fails. Upper-bound-only.

Not modelled: form submission procedure, 特定親族 definition, 退職手当等 income
concept, other items/paragraphs and other articles.
-/

namespace JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive upper bound. -/
def specWithinIncomeRequirement (income : Money) : Prop :=
  income < Nat.succ incomeCeilingYen

/-- Equivalence for all incomes. Universal, kernel-checked, axiom-free. -/
theorem agree_income_requirement (income : Money) :
    withinIncomeRequirement income ↔ specWithinIncomeRequirement income := by
  unfold withinIncomeRequirement specWithinIncomeRequirement
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- 八十五万円 (850,000) itself qualifies (以下 inclusive). -/
theorem at_ceiling : withinIncomeRequirement 850_000 := by
  unfold withinIncomeRequirement incomeCeilingYen
  decide

/-- 850,001 does NOT qualify. -/
theorem above_ceiling : ¬ withinIncomeRequirement 850_001 := by
  unfold withinIncomeRequirement incomeCeilingYen
  decide

/-- Ceiling decoded correctly: 八十五万円 = 850,000. -/
theorem ceiling_decoded : incomeCeilingYen = 850_000 := rfl

end JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling
