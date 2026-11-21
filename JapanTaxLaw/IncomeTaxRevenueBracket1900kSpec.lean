import JapanTaxLaw.IncomeTaxRevenueBracket1900k

/-!
# IncomeTaxRevenueBracket1900kSpec — independent spec for 所得税法 第二十八条(3)1

Law id: 340AC0000000033 (所得税法, Act), revision 340AC0000000033_20261001_507AC0000000070
Article: 第二十八条(3)1 — 収入金額 百九十万円以下 (¥1,900,000, inclusive)
Normative unit: NORM|29b80207cb1b9b303c8f2a8d3c08e25749e128999613e26b7902d375f1f78853

The implementation uses `revenue ≤ revenueCeilingYen`. The independent spec uses
the successor-strict form `revenue < Nat.succ revenueCeilingYen` — a distinct
formulation. Kernel proves equivalence for ALL revenues, axiom-free.

Boundary: ¥1,900,000 qualifies (以下 inclusive); ¥1,900,001 fails.

Not modelled: preceding paragraph's revenue definition, other tiers, tax
computation, other items/paragraphs and other articles.
-/

namespace JapanTaxLaw.IncomeTaxRevenueBracket1900k

open JapanTaxLaw.TaxFinance

/-- Independent spec: successor-strict form of the inclusive ceiling. -/
def specInBracket (revenue : Money) : Prop := revenue < Nat.succ revenueCeilingYen

/-- Equivalence for all revenues. Universal, axiom-free. -/
theorem agree_in_bracket (revenue : Money) : inBracket revenue ↔ specInBracket revenue := by
  unfold inBracket specInBracket
  constructor
  · intro h
    exact Nat.lt_of_le_of_lt h (Nat.lt_succ_self _)
  · intro h
    exact Nat.le_of_lt_succ h

/-- ¥1,900,000 qualifies (以下 inclusive). -/
theorem at_ceiling : inBracket 1_900_000 := by
  unfold inBracket revenueCeilingYen
  decide

/-- ¥1,900,001 does NOT qualify. -/
theorem above_ceiling : ¬ inBracket 1_900_001 := by
  unfold inBracket revenueCeilingYen
  decide

end JapanTaxLaw.IncomeTaxRevenueBracket1900k
