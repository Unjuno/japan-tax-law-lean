import JapanTaxLaw.InheritanceGiftTaxRateBracket10M15MSpec

/-!
# InheritanceGiftTaxRateBracket10M15MTests — kernel-checked checks for 相続税法 第二十一条の七(1)
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 10_000_000 := rfl
example : upperInclusiveYen = 15_000_000 := rfl
example : ¬ inBracket 10_000_000 := at_lower
example : inBracket 10_000_001 := above_lower
example : inBracket 15_000_000 := at_upper
example : ¬ inBracket 15_000_001 := above_upper
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceGiftTaxRateBracket10M15M
