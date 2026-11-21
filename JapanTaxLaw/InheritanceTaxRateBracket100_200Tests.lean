import JapanTaxLaw.InheritanceTaxRateBracket100_200Spec

/-!
# InheritanceTaxRateBracket100_200Tests — kernel-checked checks for 相続税法 第十六条の表(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket100_200

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 100_000_000 := rfl
example : upperBoundYen = 200_000_000 := rfl
example : ¬ inBracket 100_000_000 := lower_exclusive
example : inBracket 100_000_001 := first_qualifying
example : inBracket 200_000_000 := upper_inclusive
example : ¬ inBracket 200_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 100_000_000 ∧ upperBoundYen = 200_000_000 := bounds_decoded

end JapanTaxLaw.InheritanceTaxRateBracket100_200
