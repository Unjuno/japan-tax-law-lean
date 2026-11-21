import JapanTaxLaw.InheritanceTaxRateBracket30_50

/-!
# InheritanceTaxRateBracket30_50Spec — independent spec for 相続税法 第十六条の表(1)

Law id: 325AC0000000073 (相続税法, Act)
Revision: 325AC0000000073_20260401_506AC0000000008
Article: 第十六条(1)の表 — 三千万円超五千万円以下の金額
Normative unit: NORM|2f9abe1626f614eaab2879239d801935a2a1b8cdbc5dde1de4f9c5925696a72b

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL taxable values.

Boundary theorems: 30,000,000 fails (超え = strict); 30,000,001 and 50,000,000
qualify; 50,000,001 fails (以下 = inclusive upper).

Not modelled: the rate for this bracket, other brackets, base computation,
deductions, the rest of 第十六条の表, and other paragraphs.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket30_50

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

/-- 三千万円 (30,000,000) itself does NOT qualify (超え is strict). -/
theorem lower_exclusive : ¬ inBracket 30_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 30,000,001 is the first qualifying taxable value. -/
theorem first_qualifying : inBracket 30_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 五千万円 (50,000,000) itself qualifies (以下 is inclusive). -/
theorem upper_inclusive : inBracket 50_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 50,000,001 does NOT qualify. -/
theorem above_upper : ¬ inBracket 50_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- Bounds decoded correctly: 三千万円 = 30,000,000; 五千万円 = 50,000,000. -/
theorem bounds_decoded : lowerBoundYen = 30_000_000 ∧ upperBoundYen = 50_000_000 := by
  constructor <;> rfl

end JapanTaxLaw.InheritanceTaxRateBracket30_50
