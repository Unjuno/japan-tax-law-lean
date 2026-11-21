import JapanTaxLaw.OldAgePensionAnnualAmountCeiling

/-!
# OldAgePensionAnnualAmountCeilingSpec — independent spec for 地方税法施行令 附則第三条(1)5

Law id: 325CO0000000245 (地方税法施行令, CabinetOrder)
Revision: 325CO0000000245_20261101_508CO0000000083
Article: 附則第三条(1)5 — 老齢等年金 年額 十八万円未満 (strict < ¥180,000)
Normative unit: NORM|ce36009183d70cb6fbd8f7c665ef5c61f4a650f71c3d0715a220c72f780eb0ce

The implementation uses `amount < annualCeilingYen`. The independent spec uses
the inclusive-≤ complement `amount ≤ Nat.pred annualCeilingYen` (≤179,999) — a
distinct formulation. Kernel proves equivalence for ALL amounts, axiom-free.

Boundary: ¥179,999 qualifies; ¥180,000 fails (未満 = strict, boundary excluded).

Not modelled: rest of the 附則 provision, recipient definition, other items/articles.
-/

namespace JapanTaxLaw.OldAgePensionAnnualAmountCeiling

open JapanTaxLaw.TaxFinance

/-- Independent spec: strict < expressed as inclusive ≤ of the predecessor. -/
def specBelowAnnualCeiling (amount : Money) : Prop :=
  amount ≤ Nat.pred annualCeilingYen

/-- Equivalence for all amounts. Universal, kernel-checked, axiom-free. -/
theorem agree_below_ceiling (amount : Money) :
    belowAnnualCeiling amount ↔ specBelowAnnualCeiling amount := by
  unfold belowAnnualCeiling specBelowAnnualCeiling
  constructor
  · intro h
    exact Nat.le_pred_of_lt h
  · intro h
    apply Nat.lt_of_le_pred
    · decide
    · exact h

/-- ¥179,999 qualifies (strict limit ¥180,000 exclusive). -/
theorem below_limit : belowAnnualCeiling 179_999 := by
  unfold belowAnnualCeiling annualCeilingYen
  decide

/-- ¥180,000 does NOT qualify (未満 = strict). -/
theorem at_limit : ¬ belowAnnualCeiling 180_000 := by
  unfold belowAnnualCeiling annualCeilingYen
  decide

end JapanTaxLaw.OldAgePensionAnnualAmountCeiling
