import JapanTaxLaw.LocalAllocationTaxRoundingSpec

/-!
# LocalAllocationTaxRoundingTests — kernel-checked checks for 普通交付税に関する省令 第十条(18)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalAllocationTaxRounding

open JapanTaxLaw.TaxFinance

example : baseYen = 4_880 := rfl
example : roundingUnit = 1_000 := rfl
example : halfThreshold = 500 := rfl
example : hasFraction 1 := by unfold hasFraction baseYen roundingUnit; decide
example : roundsUp 1 := rounds_up_at_one
example : ¬ roundsUp 5 := rounds_down_at_five
example (l : Money) : roundsUp l ↔ specRoundsUp l := agree_rounds_up l

end JapanTaxLaw.LocalAllocationTaxRounding
