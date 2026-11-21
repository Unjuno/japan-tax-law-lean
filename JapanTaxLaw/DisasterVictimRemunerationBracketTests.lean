import JapanTaxLaw.DisasterVictimRemunerationBracketSpec

/-!
# DisasterVictimRemunerationBracketTests — kernel-checked checks for 災害被害者租税減免等施行令 附則第三条(5)第三号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.DisasterVictimRemunerationBracket

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 4_000_000 := rfl
example : upperBoundYen = 4_500_000 := rfl
example : ¬ inBracket 4_000_000 := lower_exclusive
example : inBracket 4_000_001 := first_qualifying
example : inBracket 4_500_000 := upper_inclusive
example : ¬ inBracket 4_500_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 4_000_000 ∧ upperBoundYen = 4_500_000 := bounds_decoded

end JapanTaxLaw.DisasterVictimRemunerationBracket
