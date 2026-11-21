import JapanTaxLaw.TaxAccountantBalanceSheetUnits

/-!
# TaxAccountantBalanceSheetUnitsSpec — independent spec for 税理士法施行規則 第二十二条の四(2)

Law id: 326M50000040055 (税理士法施行規則, MinisterialOrdinance)
Revision: 326M50000040055_20260901_506M60000040025
Article: 第二十二条の四(2) — balance-sheet amount presentation units 1 / 1,000 / 1,000,000 yen
Normative unit: NORM|70d9948f3c285aa1bca4e2e5dc6a76fd82dede46f1b4739c742e85b5d838098c

The implementation lists the three allowed units by equality disjunction.
The independent spec reformulates them as powers of ten:
`specIsAllowedUnit u := u = 10^0 ∨ u = 10^3 ∨ u = 10^6` — a genuinely distinct
formulation. The kernel proves equivalence for ALL u, axiom-free.

Not modelled: balance-sheet preparation rules, rounding, other paragraphs/articles.
-/

namespace JapanTaxLaw.TaxAccountantBalanceSheetUnits

open JapanTaxLaw.TaxFinance

/-- Independent spec: allowed units as powers of ten (10^0, 10^3, 10^6). -/
def specIsAllowedUnit (u : Money) : Prop :=
  u = 10 ^ 0 ∨ u = 10 ^ 3 ∨ u = 10 ^ 6

/-- Equivalence for all u. Universal, kernel-checked, axiom-free. -/
theorem agree_allowed_unit (u : Money) : isAllowedUnit u ↔ specIsAllowedUnit u := by
  unfold isAllowedUnit specIsAllowedUnit oneYenUnit thousandYenUnit millionYenUnit
  rfl

end JapanTaxLaw.TaxAccountantBalanceSheetUnits
