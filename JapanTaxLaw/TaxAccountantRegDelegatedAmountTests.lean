import JapanTaxLaw.TaxAccountantRegDelegatedAmountSpec

/-!
# TaxAccountantRegDelegatedAmountTests — kernel-checked checks for 税理士法施行令 art.6の2(2)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.TaxAccountantRegDelegatedAmount

open JapanTaxLaw.TaxFinance

example : delegatedAmountYen = 8_800 := rfl
example : isDelegatedAmount 8_800 := rfl
example : ¬ isDelegatedAmount 8_799 := by
  unfold isDelegatedAmount delegatedAmountYen; decide
example : ¬ isDelegatedAmount 8_801 := by
  unfold isDelegatedAmount delegatedAmountYen; decide
example : isDelegatedAmount 8_800 ↔ specIsDelegatedAmount 8_800 :=
  agree_delegated_amount 8_800
example : isDelegatedAmount 8_799 ↔ specIsDelegatedAmount 8_799 :=
  agree_delegated_amount 8_799
example : isDelegatedAmount delegatedAmountYen := at_delegated
example : ¬ isDelegatedAmount 8_799 := below_delegated
example : ¬ isDelegatedAmount 8_801 := above_delegated
example : delegatedAmountYen = 8_800 := amount_is_eight_thousand_eight_hundred

end JapanTaxLaw.TaxAccountantRegDelegatedAmount
