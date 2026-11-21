import JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeilingSpec

/-!
# LocalTaxSpecifiedRelativeIncomeCeilingTests — kernel-checked checks for 地方税法施行規則 第二条の三の五(3)2

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling

open JapanTaxLaw.TaxFinance

example : incomeCeilingYen = 850_000 := rfl
example : withinIncomeRequirement 850_000 := at_ceiling
example : ¬ withinIncomeRequirement 850_001 := above_ceiling
example (x : Money) : withinIncomeRequirement x ↔ specWithinIncomeRequirement x := agree_income_requirement x
example : incomeCeilingYen = 850_000 := ceiling_decoded

end JapanTaxLaw.LocalTaxSpecifiedRelativeIncomeCeiling
