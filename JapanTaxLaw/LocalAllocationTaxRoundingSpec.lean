import JapanTaxLaw.LocalAllocationTaxRounding

/-!
# LocalAllocationTaxRoundingSpec — independent spec for 普通交付税に関する省令 第十条(18)

Law id: 337M50000008017 (普通交付税に関する省令, MinisterialOrdinance)
Revision: 337M50000008017_20260724_508M60000008092
Article: 第十条(18) — ４，８８０円×L の千円未満端数を四捨五入
Normative unit: NORM|fe7a9ceb0231c6a7b59824ffad4d0f3cbeb1793f4f5d17fb8adea3a931e499aa

The implementation's `roundsUp` is `halfThreshold ≤ (baseYen*l) % roundingUnit`.
The independent spec uses the negation/complement form
`¬ (baseYen*l) % roundingUnit < halfThreshold` — a distinct formulation.
The kernel proves equivalence for ALL l via `not_lt` (axiom-free).

Boundary examples: l=1 → 4880 % 1000 = 880 ≥ 500 ⇒ rounds up;
l=5 → 24400 % 1000 = 400 < 500 ⇒ rounds down.

Not modelled: determination of L, table reference, other paragraphs/articles.
-/

namespace JapanTaxLaw.LocalAllocationTaxRounding

open JapanTaxLaw.TaxFinance

/-- Independent spec: round-up iff remainder is NOT below the half threshold. -/
def specRoundsUp (l : Money) : Prop :=
  ¬ (baseYen * l) % roundingUnit < halfThreshold

/-- Equivalence for all l. Universal, kernel-checked, axiom-free. -/
theorem agree_rounds_up (l : Money) : roundsUp l ↔ specRoundsUp l := by
  unfold roundsUp specRoundsUp
  constructor
  · intro h hlt
    exact (Nat.not_lt_of_ge h) hlt
  · intro h
    exact Nat.le_of_not_gt h

/-- l=1: 880 ≥ 500 ⇒ rounds up. -/
theorem rounds_up_at_one : roundsUp 1 := by
  unfold roundsUp baseYen roundingUnit halfThreshold
  decide

/-- l=5: 400 < 500 ⇒ does not round up. -/
theorem rounds_down_at_five : ¬ roundsUp 5 := by
  unfold roundsUp baseYen roundingUnit halfThreshold
  decide

end JapanTaxLaw.LocalAllocationTaxRounding
