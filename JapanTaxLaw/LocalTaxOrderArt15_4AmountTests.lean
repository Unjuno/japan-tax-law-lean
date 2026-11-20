import JapanTaxLaw.LocalTaxOrderArt15_4AmountSpec

/-!
# LocalTaxOrderArt15_4AmountTests — kernel-checked checks for 地方税法施行令 art.6の9の2(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxOrderArt15_4Amount

open JapanTaxLaw.TaxFinance

example : delegatedAmountYen = 2_000 := rfl
example : isDelegatedAmount 2_000 := rfl
example : ¬ isDelegatedAmount 1_999 := by
  unfold isDelegatedAmount delegatedAmountYen; decide
example : ¬ isDelegatedAmount 2_001 := by
  unfold isDelegatedAmount delegatedAmountYen; decide
example : isDelegatedAmount 2_000 ↔ specIsDelegatedAmount 2_000 :=
  agree_delegated_amount 2_000
example : isDelegatedAmount 1_999 ↔ specIsDelegatedAmount 1_999 :=
  agree_delegated_amount 1_999
example : isDelegatedAmount delegatedAmountYen := at_delegated
example : ¬ isDelegatedAmount 1_999 := below_delegated
example : ¬ isDelegatedAmount 2_001 := above_delegated
example : delegatedAmountYen = 2_000 := amount_is_two_thousand

end JapanTaxLaw.LocalTaxOrderArt15_4Amount
