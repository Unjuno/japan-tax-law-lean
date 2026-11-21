import JapanTaxLaw.InheritanceTaxRateBracket30_50Spec

/-!
# InheritanceTaxRateBracket30_50Tests — kernel-checked checks for 相続税法 第十六条の表(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket30_50

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 30_000_000 := rfl
example : upperBoundYen = 50_000_000 := rfl
example : ¬ inBracket 30_000_000 := lower_exclusive
example : inBracket 30_000_001 := first_qualifying
example : inBracket 50_000_000 := upper_inclusive
example : ¬ inBracket 50_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 30_000_000 ∧ upperBoundYen = 50_000_000 := bounds_decoded

end JapanTaxLaw.InheritanceTaxRateBracket30_50
