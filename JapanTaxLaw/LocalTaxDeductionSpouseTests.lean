import JapanTaxLaw.LocalTaxDeductionSpouseSpec

/-!
# LocalTaxDeductionSpouseTests — kernel-checked checks for 地方税法 第二十三条(1)第八号（控除対象配偶者）

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxDeductionSpouse

open JapanTaxLaw.TaxFinance

example : incomeCeilingYen = 10_000_000 := rfl
example : withinIncomeRequirement 10_000_000 := at_ceiling
example : ¬ withinIncomeRequirement 10_000_001 := above_ceiling
example (x : Money) : withinIncomeRequirement x ↔ specWithinIncomeRequirement x := agree_income_requirement x
example : incomeCeilingYen = 10_000_000 := ceiling_decoded

end JapanTaxLaw.LocalTaxDeductionSpouse
