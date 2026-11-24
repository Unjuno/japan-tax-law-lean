import JapanTaxLaw.InheritanceTaxRateBracket50_100Spec

/-
# InheritanceTaxRateBracket50_100Tests — kernel-decided checks, 相続税法 第十六条(1)

Boundary categories: zero, small input, just-below, at (excluded), just-above,
upper inclusive, upper exceeded; plus universal impl/spec agreement.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket50_100

open JapanTaxLaw.TaxFinance

example : lowerExclusiveYen = 50_000_000 := rfl
example : upperInclusiveYen = 100_000_000 := rfl

example : ¬ inBracket 0 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 49_999_999 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 50_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 50_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : inBracket 100_000_000 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide
example : ¬ inBracket 100_000_001 := by
  unfold inBracket lowerExclusiveYen upperInclusiveYen
  decide

example : inBracketBool 0 = false := by decide
example : inBracketBool 1 = false := by decide
example : inBracketBool 49_999_999 = false := by decide
example : inBracketBool 50_000_000 = false := by decide
example : inBracketBool 50_000_001 = true := by decide
example : inBracketBool 100_000_000 = true := by decide
example : inBracketBool 100_000_001 = false := by decide

example : inBracket 50_000_000 ↔ specInBracket 50_000_000 := agree_in_bracket 50_000_000
example : inBracket 50_000_001 ↔ specInBracket 50_000_001 := agree_in_bracket 50_000_001
example : inBracket 100_000_000 ↔ specInBracket 100_000_000 := agree_in_bracket 100_000_000
example (a : Money) : inBracket a ↔ specInBracket a := agree_in_bracket a

end JapanTaxLaw.InheritanceTaxRateBracket50_100
