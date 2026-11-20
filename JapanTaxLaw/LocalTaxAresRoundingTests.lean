import JapanTaxLaw.LocalTaxAresRoundingSpec

/-!
# LocalTaxAresRoundingTests — kernel-decided boundary checks for art.180(3)

All checks are `rfl` / `by decide`, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxAresRounding

open JapanTaxLaw.TaxFinance

example : fractionUnitAres = 100 := rfl
example : deemedFraction 0 = 0 := rfl
example : deemedFraction 1 = 100 := by decide
example : deemedFraction 50 = 100 := by decide
example : deemedFraction 99 = 100 := by decide
example : agreeLocalTaxAresRounding = true := by decide

end JapanTaxLaw.LocalTaxAresRounding
