import JapanTaxLaw.CustomsSameContentLimitSpec

/-!
# CustomsSameContentLimitTests — kernel-decided boundary checks

All checks are `rfl` / `by decide`, kernel-checked. The universal
correspondence theorem lives in CustomsSameContentLimitSpec.lean.
-/

namespace JapanTaxLaw.CustomsSameContentLimit

open JapanTaxLaw.TaxFinance

example : sameContentLimit = 2 := rfl
example : withinSameContentLimit 0 = true := by decide
example : withinSameContentLimit 1 = true := by decide
example : withinSameContentLimit 2 = true := by decide
example : withinSameContentLimit 3 = false := by decide
example : withinSameContentLimit 10 = false := by decide
example : agreeCustomsSameContentLimit = true := by decide

end JapanTaxLaw.CustomsSameContentLimit
