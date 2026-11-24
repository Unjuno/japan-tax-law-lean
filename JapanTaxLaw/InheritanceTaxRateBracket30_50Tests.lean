import JapanTaxLaw.InheritanceTaxRateBracket30_50Spec

/-!
# InheritanceTaxRateBracket30_50Tests — kernel-decided checks for 相続税法 第十六条(1)

Boundary categories: zero, small input, just-below, at (excluded), just-above,
upper inclusive, upper exceeded; plus universal impl/spec agreement.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket30_50

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 30_000_000 := rfl
example : upperBoundYen = 50_000_000 := rfl

example : ¬ inBracket 0 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide
example : ¬ inBracket 29_999_999 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide
example : ¬ inBracket 30_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide
example : inBracket 30_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide
example : inBracket 50_000_000 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide
example : ¬ inBracket 50_000_001 := by
  unfold inBracket lowerBoundYen upperBoundYen
  decide

example : inBracketBool 0 = false := by decide
example : inBracketBool 1 = false := by decide
example : inBracketBool 29_999_999 = false := by decide
example : inBracketBool 30_000_000 = false := by decide
example : inBracketBool 30_000_001 = true := by decide
example : inBracketBool 50_000_000 = true := by decide
example : inBracketBool 50_000_001 = false := by decide

example : inBracket 30_000_000 ↔ specInBracket 30_000_000 := agree_bracket 30_000_000
example : inBracket 30_000_001 ↔ specInBracket 30_000_001 := agree_bracket 30_000_001
example : inBracket 50_000_000 ↔ specInBracket 50_000_000 := agree_bracket 50_000_000
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x

end JapanTaxLaw.InheritanceTaxRateBracket30_50
