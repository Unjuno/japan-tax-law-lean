import JapanTaxLaw.InheritanceTaxRateBracket200_300Spec

/-!
# InheritanceTaxRateBracket200_300Tests — kernel-checked checks for 相続税法 第十六条の表(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket200_300

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 200_000_000 := rfl
example : upperBoundYen = 300_000_000 := rfl
example : ¬ inBracket 200_000_000 := lower_exclusive
example : inBracket 200_000_001 := first_qualifying
example : inBracket 300_000_000 := upper_inclusive
example : ¬ inBracket 300_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 200_000_000 ∧ upperBoundYen = 300_000_000 := bounds_decoded

end JapanTaxLaw.InheritanceTaxRateBracket200_300
