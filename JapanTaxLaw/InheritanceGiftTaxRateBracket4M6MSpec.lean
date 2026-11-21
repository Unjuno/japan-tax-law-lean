import JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M

/-!
# InheritanceGiftTaxRateBracket4M6MSpec — independent spec for 相続税法 第二十一条の七(1)

Law id: 325AC0000000073 (相続税法, Act), revision 325AC0000000073_20260401_506AC0000000008
Article: 第二十一条の七(1) — 贈与税 税率表 upper column, [¥4,000,000, ¥6,000,000]
Normative unit: NORM|246a67a42516a454e7df2f7fc108debef44b46afd4aef3c1dd5e5f0e08115c11

The implementation uses `4,000,000 < amount ∧ amount ≤ 6,000,000`. The
independent spec uses the inclusive-≤ complement of the strict lower bound
(`Nat.succ 4,000,000 ≤ amount`) together with `amount ≤ 6,000,000` — a distinct
formulation. Kernel proves equivalence for ALL amounts, axiom-free.

Boundaries: ¥4,000,000 excluded (を超え strict); ¥6,000,000 included (以下).

Not modelled: paired rate, other brackets, deduction rules, other articles.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor form of the strict lower bound plus inclusive upper. -/
def specInBracket (amount : Money) : Prop :=
  Nat.succ lowerExclusiveYen ≤ amount ∧ amount ≤ upperInclusiveYen

/-- Equivalence for all amounts. Universal, axiom-free. -/
theorem agree_in_bracket (amount : Money) :
    inBracket amount ↔ specInBracket amount := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact ⟨Nat.succ_le_of_lt h.1, h.2⟩
  · intro h
    exact ⟨Nat.lt_of_succ_le h.1, h.2⟩

/-- ¥4,000,000 excluded (を超え strict). -/
theorem at_lower : ¬ inBracket 4_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

/-- ¥4,000,001 qualifies. -/
theorem above_lower : inBracket 4_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

/-- ¥6,000,000 included (以下). -/
theorem at_upper : inBracket 6_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

/-- ¥6,000,001 fails. -/
theorem above_upper : ¬ inBracket 6_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

end JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M
