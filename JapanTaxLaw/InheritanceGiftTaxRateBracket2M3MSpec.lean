import JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M

/-!
# InheritanceGiftTaxRateBracket2M3MSpec — independent spec for 相続税法 第二十一条の七

Law id: 325AC0000000073 (相続税法, Act)
Revision: 325AC0000000073_20260401_506AC0000000008
Article: 第二十一条の七 — （贈与税の税率）上欄区分, 二百万円を超え三百万円以下の金額
Normative unit: NORM|a1c39d3977b9d2a68fc6dd7125b555369ca7e764597c9b9c4673c8d94ae83941

The implementation uses `(2,000,000 < amount) ∧ (amount ≤ 3,000,000)`.
The independent spec uses a successor-based half-open form
`(Nat.succ 2,000,000 ≤ amount) ∧ (amount < Nat.succ 3,000,000)` — a distinct
formulation. The kernel proves equivalence for ALL amounts, axiom-free.

Boundaries: 2,000,000 excluded (を超え strict); 3,000,000 included (以下 inclusive).

Not modelled: the paired rate cell, other brackets, deduction rules, other paragraphs
and other articles.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based half-open interval. -/
def specInBracket (amount : Money) : Prop :=
  Nat.succ lowerExclusiveYen ≤ amount ∧ amount < Nat.succ upperInclusiveYen

/-- Equivalence for all amounts. Axiom-free. -/
theorem agree_in_bracket (amount : Money) :
    inBracket amount ↔ specInBracket amount := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact ⟨Nat.succ_le_of_lt h.1, Nat.lt_of_le_of_lt h.2 (Nat.lt_succ_self _)⟩
  · intro h
    exact ⟨Nat.lt_of_succ_le h.1, Nat.le_of_lt_succ h.2⟩

end JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M
