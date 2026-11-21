import JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16Spec

/-!
# LiquorTaxSakeAlcoholBracket15_16Tests — kernel-checked checks for 酒税法 附則第三十八条(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16

open JapanTaxLaw.TaxFinance

example : alcoholLowerInclusiveDegrees = 15 := rfl
example : alcoholUpperExclusiveDegrees = 16 := rfl
example : taxAmountYen = 570_600 := amount_decoded
example : ¬ inBracket 14 := by unfold inBracket; decide
example : inBracket 15 := at_lower
example : ¬ inBracket 16 := at_upper
example (d : Nat) : inBracket d ↔ specInBracket d := agree_in_bracket d

end JapanTaxLaw.LiquorTaxSakeAlcoholBracket15_16
