import JapanTaxLaw.LocalTaxIncomeBracket4_8Spec

/-!
# LocalTaxIncomeBracket4_8Tests — kernel-checked checks for 地方税法 第七十二条の二十四の七(1)第三号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxIncomeBracket4_8

open JapanTaxLaw.TaxFinance

example : lowerBoundYen = 4_000_000 := rfl
example : upperBoundYen = 8_000_000 := rfl
example : ¬ inBracket 4_000_000 := lower_exclusive
example : inBracket 4_000_001 := first_qualifying
example : inBracket 8_000_000 := upper_inclusive
example : ¬ inBracket 8_000_001 := above_upper
example (x : Money) : inBracket x ↔ specInBracket x := agree_bracket x
example : lowerBoundYen = 4_000_000 ∧ upperBoundYen = 8_000_000 := bounds_decoded

end JapanTaxLaw.LocalTaxIncomeBracket4_8
