import JapanTaxLaw.DisasterGrantIncomeBracket

/-!
# DisasterGrantIncomeBracketSpec — independent spec for 災害被害者租税減免等施行令 附則第三条(5)第一号

Law id: 322CO0000000268 (災害被害者租税減免等施行令, Cabinet Order)
Revision: 322CO0000000268_20251201_507CO0000000120
Article: 附則第三条(5)第一号 — 六百万円超七百五十万円以下の被災給与所得者等
Normative unit: NORM|c954475ca9c88c0944dd316e84af4945d6863fea5ec0b180ecf1813c71ca92db

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL incomes.

Boundary theorems: 6,000,000 fails (超え = strict); 6,000,001 and 7,500,000
qualify; 7,500,001 fails (以下 = inclusive upper).

Not modelled: the substantive 災害被害者租税減免法, the gated tax benefit, other
items of the definition, 「災害時」 timing, other paragraphs, 省令 details.
-/

namespace JapanTaxLaw.DisasterGrantIncomeBracket

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based lower bound with inclusive upper. -/
def specInBracket (estimatedIncome : Money) : Prop :=
  Nat.succ lowerBoundYen ≤ estimatedIncome ∧ estimatedIncome ≤ upperBoundYen

/-- Correspondence for all incomes. Universal, kernel-checked. -/
theorem agree_bracket (estimatedIncome : Money) :
    inBracket estimatedIncome ↔ specInBracket estimatedIncome := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact ⟨Nat.succ_le_of_lt h.1, h.2⟩
  · intro h
    exact ⟨Nat.lt_of_succ_le h.1, h.2⟩

/-- 六百万円 (6,000,000) itself does NOT qualify (超え is strict). -/
theorem lower_exclusive : ¬ inBracket 6_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 6,000,001 is the first qualifying income. -/
theorem first_qualifying : inBracket 6_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 七百五十万円 (7,500,000) itself qualifies (以下 is inclusive). -/
theorem upper_inclusive : inBracket 7_500_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 7,500,001 does NOT qualify. -/
theorem above_upper : ¬ inBracket 7_500_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- Bounds decoded correctly: 六百万円 = 6,000,000; 七百五十万円 = 7,500,000. -/
theorem bounds_decoded : lowerBoundYen = 6_000_000 ∧ upperBoundYen = 7_500_000 := by
  constructor <;> rfl

end JapanTaxLaw.DisasterGrantIncomeBracket
