import JapanTaxLaw.DisasterVictimRemunerationUpperBracket

/-!
# DisasterVictimRemunerationUpperBracketSpec — independent spec for 災害被害者租税減免等施行令 附則第三条(5)第四号

Law id: 322CO0000000268 (災害被害者租税減免等施行令, Cabinet Order)
Revision: 322CO0000000268_20251201_507CO0000000120
Article: 附則第三条(5)第四号 — 四百五十万円超六百万円以下の報酬等の支払を受ける者
Normative unit: NORM|15ab667908d0c90131769e67aca475da403c9dd4f7b020c2bb2a96865ca48ffb

The implementation uses `lowerBoundYen < x ∧ x ≤ upperBoundYen`. The independent
spec reformulates the strict lower bound as a successor-based non-strict bound:
`Nat.succ lowerBoundYen ≤ x ∧ x ≤ upperBoundYen` (equivalent via `Nat.succ_le_iff`,
but a distinct formulation). The kernel proves equivalence for ALL incomes.

Boundary theorems: 4,500,000 fails (超え = strict); 4,500,001 and 6,000,000
qualify; 6,000,001 fails (以下 = inclusive upper).

Distinct norm unit from NORM|8746221ba199 (被災給与所得者) and NORM|8fb64d19e
(報酬等 Item 3, 4M–4.5M).

Not modelled: the substantive 災害被害者租税減免法, the gated tax benefit, other
items of the definition, 「災害時」 timing, other paragraphs, 省令 details.
-/

namespace JapanTaxLaw.DisasterVictimRemunerationUpperBracket

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

end JapanTaxLaw.DisasterVictimRemunerationUpperBracket
