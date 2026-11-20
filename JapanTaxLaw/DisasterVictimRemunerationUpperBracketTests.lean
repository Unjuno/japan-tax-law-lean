import JapanTaxLaw.DisasterVictimRemunerationUpperBracketSpec

/-!
# DisasterVictimRemunerationUpperBracketTests — kernel-checked checks for 災害被害者租税減免等施行令 附則第三条(5)第四号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.DisasterVictimRemunerationUpperBracket

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 4_500_000 := rfl
example : upperBoundYen = 6_000_000 := rfl
example : ¬ inBracket 4_500_000 := lower_exclusive
example : inBracket 4_500_001 := first_qualifying
example : inBracket 6_000_000 := upper_inclusive
example : ¬ inBracket 6_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 4_500_000 ∧ upperBoundYen = 6_000_000 := bounds_decoded

end JapanTaxLaw.DisasterVictimRemunerationUpperBracket
