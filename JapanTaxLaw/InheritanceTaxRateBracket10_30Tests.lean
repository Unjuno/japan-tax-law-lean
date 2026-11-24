import JapanTaxLaw.InheritanceTaxRateBracket10_30Spec

/-
# InheritanceTaxRateBracket10_30Tests — kernel-decided boundary checks, 相続税法 第16(1)

Boundary categories: zero, small input, just-below, at (excluded), just-above,
upper inclusive, upper exceeded; plus universal impl/spec agreement.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket10_30

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 10_000_000 := rfl
example : upperInclusiveYen = 30_000_000 := rfl

example : ¬ inBracket 0 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 9_999_999 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 10_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 10_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 30_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 30_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

example : inBracketBool 0 = false := by decide
example : inBracketBool 1 = false := by decide
example : inBracketBool 9_999_999 = false := by decide
example : inBracketBool 10_000_000 = false := by decide
example : inBracketBool 10_000_001 = true := by decide
example : inBracketBool 30_000_000 = true := by decide
example : inBracketBool 30_000_001 = false := by decide

example : inBracket 10_000_000 ↔ specInBracket 10_000_000 := agree_in_bracket 10_000_000
example : inBracket 10_000_001 ↔ specInBracket 10_000_001 := agree_in_bracket 10_000_001
example : inBracket 30_000_000 ↔ specInBracket 30_000_000 := agree_in_bracket 30_000_000
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceTaxRateBracket10_30
