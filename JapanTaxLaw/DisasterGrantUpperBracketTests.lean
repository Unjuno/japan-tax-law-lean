import JapanTaxLaw.DisasterGrantUpperBracketSpec

/-!
# DisasterGrantUpperBracketTests — kernel-checked checks for 災害被害者租税減免等施行令 附則第三条(5)第二号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.DisasterGrantUpperBracket

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 7_500_000 := rfl
example : upperBoundYen = 10_000_000 := rfl
example : ¬ inBracket 7_500_000 := lower_exclusive
example : inBracket 7_500_001 := first_qualifying
example : inBracket 10_000_000 := upper_inclusive
example : ¬ inBracket 10_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 7_500_000 ∧ upperBoundYen = 10_000_000 := bounds_decoded

end JapanTaxLaw.DisasterGrantUpperBracket
