import JapanTaxLaw.InheritanceTaxRateBracket200_300

/-!
# InheritanceTaxRateBracket200_300Spec — independent spec for 相続税法 第十六条の表(1)

Law id: 325AC0000000073 (相続税法, Act)
Revision: 325AC0000000073_20260401_506AC0000000008
Article: 第十六条の表(1) の税率区分 — 二億円超三億円以下の金額
Normative unit: NORM|c3d2149ef0b13b932aab3cea60cf22e9f8ed6a661e1e8660186fb6a35cf5fabc

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL taxable values.

Boundary theorems: 200,000,000 fails (超え = strict); 200,000,001 and 300,000,000
qualify; 300,000,001 fails (以下 = inclusive upper).

Not modelled: the rate, other brackets, base computation, deductions, the rest of
第十六条の表, and other paragraphs.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket200_300

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

/-- 二億円 (200,000,000) itself does NOT qualify (超え is strict). -/
theorem lower_exclusive : ¬ inBracket 200_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 200,000,001 is the first qualifying taxable value. -/
theorem first_qualifying : inBracket 200_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 三億円 (300,000,000) itself qualifies (以下 is inclusive). -/
theorem upper_inclusive : inBracket 300_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 300,000,001 does NOT qualify. -/
theorem above_upper : ¬ inBracket 300_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- Bounds decoded correctly: 二億円 = 200,000,000; 三億円 = 300,000,000. -/
theorem bounds_decoded : lowerBoundYen = 200_000_000 ∧ upperBoundYen = 300_000_000 := by
  constructor <;> rfl

end JapanTaxLaw.InheritanceTaxRateBracket200_300
