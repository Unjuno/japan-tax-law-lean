import JapanTaxLaw.DisasterGrantIncomeBracketSpec

/-!
# DisasterGrantIncomeBracketTests — kernel-checked checks for 災害被害者租税減免等施行令 附則第三条(5)第一号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.DisasterGrantIncomeBracket

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 6_000_000 := rfl
example : upperBoundYen = 7_500_000 := rfl
example : ¬ inBracket 6_000_000 := lower_exclusive
example : inBracket 6_000_001 := first_qualifying
example : inBracket 7_500_000 := upper_inclusive
example : ¬ inBracket 7_500_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 6_000_000 ∧ upperBoundYen = 7_500_000 := bounds_decoded

end JapanTaxLaw.DisasterGrantIncomeBracket
