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

-- ==== appended boundary examples (kernel-decided) ====
-- (a) zero input: withinSameContentLimit 0 = true — already covered above.

-- (b) small positive input 1..13 (count unit 本; 二本 = 2 admitted, larger excluded).
example : withinSameContentLimit 13 = false := by decide

-- (c) Bool-only function: genuine saturating Nat subtraction at the statutory
--     threshold 二本 (sameContentLimit = 2); one above the limit saturates to 0.
example : sameContentLimit - 3 = 0 := by decide

end JapanTaxLaw.CustomsSameContentLimit
