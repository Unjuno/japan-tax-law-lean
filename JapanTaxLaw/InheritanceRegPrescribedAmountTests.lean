import JapanTaxLaw.InheritanceRegPrescribedAmountSpec

/-!
# InheritanceRegPrescribedAmountTests — kernel-checked checks for 相続税法施行規則 art.30

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceRegPrescribedAmount

open JapanTaxLaw.TaxFinance

example : prescribedAmountYen = 1_000_000 := rfl
example : isPrescribedAmount 1_000_000 := rfl
example : ¬ isPrescribedAmount 999_999 := by
  unfold isPrescribedAmount prescribedAmountYen; decide
example : ¬ isPrescribedAmount 1_000_001 := by
  unfold isPrescribedAmount prescribedAmountYen; decide
example : isPrescribedAmount 1_000_000 ↔ specIsPrescribedAmount 1_000_000 :=
  agree_prescribed_amount 1_000_000
example : isPrescribedAmount 999_999 ↔ specIsPrescribedAmount 999_999 :=
  agree_prescribed_amount 999_999
example : isPrescribedAmount prescribedAmountYen := at_prescribed
example : ¬ isPrescribedAmount 999_999 := below_prescribed
example : ¬ isPrescribedAmount 1_000_001 := above_prescribed
example : prescribedAmountYen = 1_000_000 := amount_is_one_million

end JapanTaxLaw.InheritanceRegPrescribedAmount
