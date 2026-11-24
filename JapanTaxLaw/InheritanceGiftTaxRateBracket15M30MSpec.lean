import JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M

/-
# InheritanceGiftTaxRateBracket15M30MSpec — independent spec for 相続税法 第二十一条の七(1)

Law id: 325AC0000000073 (相続税法, Act), revision 325AC0000000073_20260401_506AC0000000008
Article: 第二十一条の七(1) — 贈与税 税率表 upper column, [¥15,000,000, ¥30,000,000]
Normative unit: NORM|68cc7a516287f33351d259921d3e7dde2e314a75cde606a098b736c6e4319ab5

The implementation uses `15,000,000 < amount ∧ amount ≤ 30,000,000`. The
independent spec uses the inclusive-≤ complement of the strict lower bound
(`Nat.succ 15,000,000 ≤ amount`) together with `amount ≤ 30,000,000` — a distinct
formulation that reuses no implementation identifier in its bound predicates.
Kernel proves equivalence for ALL amounts, axiom-free.

Boundaries: ¥15,000,000 excluded (を超え strict); ¥30,000,000 included (以下).

Not modelled: paired rate, other brackets, deduction rules, other articles.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor form of the strict lower bound plus inclusive upper. -/
def specInBracket (amount : Money) : Prop :=
  Nat.succ 15_000_000 ≤ amount ∧ amount ≤ 30_000_000

/-- Equivalence for all amounts. Universal, axiom-free. -/
theorem agree_in_bracket (amount : Money) :
    inBracket amount ↔ specInBracket amount := by
  unfold inBracket specInBracket lowerExclusiveYen upperInclusiveYen
  constructor
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.succ_le_of_lt lowerOk, upperOk⟩
  · rintro ⟨lowerOk, upperOk⟩
    exact ⟨Nat.lt_of_succ_le lowerOk, upperOk⟩

-- Boundary examples live in the Tests module, not here: this module's numeric
-- literals must be only the two statutory bounds transcribed from 原文.

end JapanTaxLaw.InheritanceGiftTaxRateBracket15M30M
