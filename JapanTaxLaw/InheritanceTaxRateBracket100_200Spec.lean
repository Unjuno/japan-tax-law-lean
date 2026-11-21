import JapanTaxLaw.InheritanceTaxRateBracket100_200

/-!
# InheritanceTaxRateBracket100_200Spec — independent spec for 相続税法 第十六条の表(1)

Law id: 325AC0000000073 (相続税法, Act)
Revision: 325AC0000000073_20260401_506AC0000000008
Article: 第十六条(1)の表 — 一億円超二億円以下の金額
Normative unit: NORM|ef39cde900972f597087b478ee9eb39ed5f8ec37898a750094d49e1cba127582

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL taxable values.

Boundary theorems: 100,000,000 fails (超え = strict); 100,000,001 and 200,000,000
qualify; 200,000,001 fails (以下 = inclusive upper).

Not modelled: the rate for this bracket, other brackets, base computation,
deductions, the rest of 第十六条の表, and other paragraphs.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket100_200

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based lower bound with inclusive upper. -/
def specInBracket (taxableValue : Money) : Prop :=
  Nat.succ lowerBoundYen ≤ taxableValue ∧ taxableValue ≤ upperBoundYen

/-- Correspondence for all taxable values. Universal, kernel-checked. -/
theorem agree_bracket (taxableValue : Money) :
    inBracket taxableValue ↔ specInBracket taxableValue := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact ⟨Nat.succ_le_of_lt h.1, h.2⟩
  · intro h
    exact ⟨Nat.lt_of_succ_le h.1, h.2⟩

/-- 一億円 (100,000,000) itself does NOT qualify (超え is strict). -/
theorem lower_exclusive : ¬ inBracket 100_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 100,000,001 is the first qualifying taxable value. -/
theorem first_qualifying : inBracket 100_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 二億円 (200,000,000) itself qualifies (以下 is inclusive). -/
theorem upper_inclusive : inBracket 200_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 200,000,001 does NOT qualify. -/
theorem above_upper : ¬ inBracket 200_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- Bounds decoded correctly: 一億円 = 100,000,000; 二億円 = 200,000,000. -/
theorem bounds_decoded : lowerBoundYen = 100_000_000 ∧ upperBoundYen = 200_000_000 := by
  constructor <;> rfl

end JapanTaxLaw.InheritanceTaxRateBracket100_200
