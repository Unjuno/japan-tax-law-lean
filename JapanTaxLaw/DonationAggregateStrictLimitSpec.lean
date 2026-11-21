import JapanTaxLaw.DonationAggregateStrictLimit

/-!
# DonationAggregateStrictLimitSpec — independent spec for 租税特別措置法施行規則 十九条の十の五

Law id: 332M50000040015 (租税特別措置法施行規則, MinisterialOrdinance)
Revision: 332M50000040015_20261101_507M60000040026
Article: 第十九条の十の五(1)8 — 寄附金合計額 千円に満たない (strict < ¥1,000)
Normative unit: NORM|f9d7893b78c08532ce572d0c5aae7b2d0e7d7c8519ae58683652401a1808c3a7

The implementation uses `total < strictLimitYen`. The independent spec uses
the inclusive-≤ complement `total ≤ Nat.pred strictLimitYen` — a distinct
formulation (≤ 999 vs < 1000). The kernel proves equivalence for ALL totals,
axiom-free via core Nat lemmas.

Boundary theorems: 999 qualifies; 1,000 fails (千円に満たない = strict, boundary excluded).

Not modelled: assessment-period definition, donation acceptance rules, other
items/paragraphs and other articles.
-/

namespace JapanTaxLaw.DonationAggregateStrictLimit

open JapanTaxLaw.TaxFinance

/-- Independent spec: inclusive complement of strict '< 1000' (i.e. ≤ 999). -/
def specWithinStrictLimit (total : Money) : Prop :=
  total ≤ Nat.pred strictLimitYen

/-- Equivalence for all totals. Universal, kernel-checked, axiom-free. -/
theorem agree_strict_limit (total : Money) :
    withinStrictLimit total ↔ specWithinStrictLimit total := by
  unfold withinStrictLimit specWithinStrictLimit strictLimitYen
  constructor
  · intro h
    exact Nat.le_pred_of_lt h
  · intro h
    apply Nat.lt_of_le_pred
    · decide
    · exact h

/-- ¥999 qualifies (strict limit ¥1,000 exclusive). -/
theorem below_limit : withinStrictLimit 999 := by
  unfold withinStrictLimit strictLimitYen
  decide

/-- ¥1,000 does NOT qualify (千円に満たない = strict). -/
theorem at_limit : ¬ withinStrictLimit 1_000 := by
  unfold withinStrictLimit strictLimitYen
  decide

end JapanTaxLaw.DonationAggregateStrictLimit
