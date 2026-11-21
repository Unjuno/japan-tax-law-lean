import JapanTaxLaw.TaxAccountantFineLimitSpec

/-!
# TaxAccountantFineLimitTests — kernel-checked checks for 税理士法 第六十一条(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.TaxAccountantFineLimit

open JapanTaxLaw.TaxFinance

example : maxFineYen = 1_000_000 := rfl
example : withinFineLimit 1_000_000 := at_ceiling
example : ¬ withinFineLimit 1_000_001 := above_ceiling
example (x : Money) : withinFineLimit x ↔ specWithinFineLimit x := agree_fine_limit x
example : maxFineYen = 1_000_000 := ceiling_decoded

end JapanTaxLaw.TaxAccountantFineLimit
