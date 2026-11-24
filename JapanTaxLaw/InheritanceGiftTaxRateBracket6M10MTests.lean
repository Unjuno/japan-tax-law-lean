import JapanTaxLaw.InheritanceGiftTaxRateBracket6M10MSpec

/-
# InheritanceGiftTaxRateBracket6M10MTests — kernel-decided boundary checks, 相続税法 第21_7(1)

Boundary categories: zero, small input, just-below, at (excluded), just-above,
upper inclusive, upper exceeded; plus universal impl/spec agreement.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 6_000_000 := rfl
example : upperInclusiveYen = 10_000_000 := rfl

example : ¬ inBracket 0 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 5_999_999 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 6_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 6_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 10_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 10_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

example : inBracketBool 0 = false := by decide
example : inBracketBool 1 = false := by decide
example : inBracketBool 5_999_999 = false := by decide
example : inBracketBool 6_000_000 = false := by decide
example : inBracketBool 6_000_001 = true := by decide
example : inBracketBool 10_000_000 = true := by decide
example : inBracketBool 10_000_001 = false := by decide

example : inBracket 6_000_000 ↔ specInBracket 6_000_000 := agree_in_bracket 6_000_000
example : inBracket 6_000_001 ↔ specInBracket 6_000_001 := agree_in_bracket 6_000_001
example : inBracket 10_000_000 ↔ specInBracket 10_000_000 := agree_in_bracket 10_000_000
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceGiftTaxRateBracket6M10M
