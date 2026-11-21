import JapanTaxLaw.InheritanceGiftTaxRateBracket4M6MSpec

/-!
# InheritanceGiftTaxRateBracket4M6MTests — kernel-checked checks for 相続税法 第二十一条の七(1)
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 4_000_000 := rfl
example : upperInclusiveYen = 6_000_000 := rfl
example : ¬ inBracket 4_000_000 := at_lower
example : inBracket 4_000_001 := above_lower
example : inBracket 6_000_000 := at_upper
example : ¬ inBracket 6_000_001 := above_upper
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceGiftTaxRateBracket4M6M
