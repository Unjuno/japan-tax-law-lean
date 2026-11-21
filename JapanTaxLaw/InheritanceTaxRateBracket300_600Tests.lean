import JapanTaxLaw.InheritanceTaxRateBracket300_600Spec

/-!
# InheritanceTaxRateBracket300_600Tests — kernel-checked checks for 相続税法 第十六条の表(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceTaxRateBracket300_600

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 300_000_000 := rfl
example : upperBoundYen = 600_000_000 := rfl
example : ¬ inBracket 300_000_000 := lower_exclusive
example : inBracket 300_000_001 := first_qualifying
example : inBracket 600_000_000 := upper_inclusive
example : ¬ inBracket 600_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 300_000_000 ∧ upperBoundYen = 600_000_000 := bounds_decoded

end JapanTaxLaw.InheritanceTaxRateBracket300_600
