import JapanTaxLaw.IncomeTaxRevenueBracket1900kSpec

/-!
# IncomeTaxRevenueBracket1900kTests — kernel-checked checks for 所得税法 第二十八条(3)1
-/

namespace JapanTaxLaw.IncomeTaxRevenueBracket1900k

open JapanTaxLaw.TaxFinance

example : revenueCeilingYen = 1_900_000 := rfl
example : inBracket 1_900_000 := at_ceiling
example : ¬ inBracket 1_900_001 := above_ceiling
example (r : Money) : inBracket r ↔ specInBracket r := agree_in_bracket r

end JapanTaxLaw.IncomeTaxRevenueBracket1900k
