import JapanTaxLaw.InheritanceGiftTaxRateBracket3M4MSpec

/-
# InheritanceGiftTaxRateBracket3M4MTests — kernel-decided boundary checks, 相続税法 第21_7(1)

Boundary categories: zero, small input, just-below, at (excluded), just-above,
upper inclusive, upper exceeded; plus universal impl/spec agreement.
-/

namespace JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 3_000_000 := rfl
example : upperInclusiveYen = 4_000_000 := rfl

example : ¬ inBracket 0 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 2_999_999 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 3_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 3_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 4_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 4_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

example : inBracketBool 0 = false := by decide
example : inBracketBool 1 = false := by decide
example : inBracketBool 2_999_999 = false := by decide
example : inBracketBool 3_000_000 = false := by decide
example : inBracketBool 3_000_001 = true := by decide
example : inBracketBool 4_000_000 = true := by decide
example : inBracketBool 4_000_001 = false := by decide

example : inBracket 3_000_000 ↔ specInBracket 3_000_000 := agree_in_bracket 3_000_000
example : inBracket 3_000_001 ↔ specInBracket 3_000_001 := agree_in_bracket 3_000_001
example : inBracket 4_000_000 ↔ specInBracket 4_000_000 := agree_in_bracket 4_000_000
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceGiftTaxRateBracket3M4M
