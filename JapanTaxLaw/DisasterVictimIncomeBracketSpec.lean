import JapanTaxLaw.DisasterVictimIncomeBracket

/-!
# DisasterVictimIncomeBracketSpec — independent spec for 災害被害者租税減免等施行令 第三条 附則

Law id: 322CO0000000268 (災害被害者租税減免等施行令, Cabinet Order)
Revision: 322CO0000000268_20251201_507CO0000000120
Article: 附則第三条 — 四百五十万円超六百万円以下の被災給与所得者
Normative unit: NORM|8746221ba19978635b4364ecd7d12d09b01c13aea26958c14ab66b4f027ec141

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL incomes.

Boundary theorems: 4,500,000 fails (超え = strict); 4,500,001 and 6,000,000
qualify; 6,000,001 fails (以下 = inclusive upper).

Not modelled: the substantive 災害被害者租税減免法, the gated tax benefit, other
items of the definition, 「災害時」 timing, other paragraphs, 省令 details.
-/

namespace JapanTaxLaw.DisasterVictimIncomeBracket

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-based lower bound (succ 4500000 ≤ x) with inclusive upper. -/
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

/-- 四百五十万円 (4,500,000) itself does NOT qualify (超え is strict). -/
theorem lower_exclusive : ¬ inBracket 4_500_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 4,500,001 is the first qualifying income. -/
theorem first_qualifying : inBracket 4_500_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 六百万円 (6,000,000) itself qualifies (以下 is inclusive). -/
theorem upper_inclusive : inBracket 6_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- 6,000,001 does NOT qualify. -/
theorem above_upper : ¬ inBracket 6_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

/-- Bounds decoded correctly: 四百五十万円 = 4,500,000; 六百万円 = 6,000,000. -/
theorem bounds_decoded : lowerBoundYen = 4_500_000 ∧ upperBoundYen = 6_000_000 := by
  constructor <;> rfl

end JapanTaxLaw.DisasterVictimIncomeBracket
