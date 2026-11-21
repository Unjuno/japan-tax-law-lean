import JapanTaxLaw.InheritanceGiftTaxRateBracket2M3MSpec

/-!
# InheritanceGiftTaxRateBracket2M3MTests — kernel-checked checks for 相続税法 第二十一条の七

All checks are `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 2_000_000 := rfl
example : upperInclusiveYen = 3_000_000 := rfl
example : ¬ inBracket 2_000_000 := by unfold inBracket; decide
example : inBracket 2_000_001 := by unfold inBracket; decide
example : inBracket 3_000_000 := by unfold inBracket; decide
example : ¬ inBracket 3_000_001 := by unfold inBracket; decide
example (x : Money) : inBracket x ↔ specInBracket x := agree_in_bracket x

end JapanTaxLaw.InheritanceGiftTaxRateBracket2M3M
