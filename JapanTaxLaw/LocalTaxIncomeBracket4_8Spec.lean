import JapanTaxLaw.LocalTaxIncomeBracket4_8

/-!
# LocalTaxIncomeBracket4_8Spec — independent spec for 地方税法 第七十二条の二十四の七(1)第三号

Law id: 325AC0000000226 (地方税法, Act)
Revision: 325AC0000000226_20261101_508AC0000000002
Article: 第七十二条の二十四の七(1)第三号 — 年四百万円超年八百万円以下の金額
Normative unit: NORM|5fabf587efefedb1bf83283e26ba09486268120cb013adc7cf04d058d359c414

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL incomes.

Boundary theorems: 4,000,000 fails (超え = strict); 4,000,001 and 8,000,000
qualify; 8,000,001 fails (以下 = inclusive upper).

Not modelled: the rate for this bracket, other brackets, the surrounding
computation, other items/paragraphs and other articles.
-/

namespace JapanTaxLaw.LocalTaxIncomeBracket4_8

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based lower bound with inclusive upper. -/
def specInBracket (income : Money) : Prop :=
  Nat.succ lowerBoundYen ≤ income ∧ income ≤ upperBoundYen

/-- Correspondence for all incomes. Universal, kernel-checked. -/
theorem agree_bracket (income : Money) :
    inBracket income ↔ specInBracket income := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact ⟨Nat.succ_le_of_lt h.1, h.2⟩
  · intro h
    exact ⟨Nat.lt_of_succ_le h.1, h.2⟩

/-- 四百万円 (4,000,000) itself does NOT qualify (超え is strict). -/
theorem lower_exclusive : ¬ inBracket 4_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 4,000,001 is the first qualifying income. -/
theorem first_qualifying : inBracket 4_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 八百万円 (8,000,000) itself qualifies (以下 is inclusive). -/
theorem upper_inclusive : inBracket 8_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 8,000,001 does NOT qualify. -/
theorem above_upper : ¬ inBracket 8_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- Bounds decoded correctly: 四百万円 = 4,000,000; 八百万円 = 8,000,000. -/
theorem bounds_decoded : lowerBoundYen = 4_000_000 ∧ upperBoundYen = 8_000_000 := by
  constructor <;> rfl

end JapanTaxLaw.LocalTaxIncomeBracket4_8
