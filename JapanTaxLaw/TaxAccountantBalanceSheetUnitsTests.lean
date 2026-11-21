import JapanTaxLaw.TaxAccountantBalanceSheetUnitsSpec

/-!
# TaxAccountantBalanceSheetUnitsTests — kernel-checked checks for 税理士法施行規則 第二十二条の四(2)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.TaxAccountantBalanceSheetUnits

open JapanTaxLaw.TaxFinance

example : oneYenUnit = 1 := rfl
example : thousandYenUnit = 1_000 := rfl
example : millionYenUnit = 1_000_000 := rfl
example : isAllowedUnit 1 := by unfold isAllowedUnit; decide
example : isAllowedUnit 1_000 := by unfold isAllowedUnit; decide
example : isAllowedUnit 1_000_000 := by unfold isAllowedUnit; decide
example : ¬ isAllowedUnit 2 := by unfold isAllowedUnit; decide
example (u : Money) : isAllowedUnit u ↔ specIsAllowedUnit u := agree_allowed_unit u

end JapanTaxLaw.TaxAccountantBalanceSheetUnits
