import JapanTaxLaw.InheritanceRegSurrenderValueConditionSpec

/-!
# InheritanceRegSurrenderValueConditionTests — kernel-checked checks for 相続税法施行規則 第三十条(6)第一号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.InheritanceRegSurrenderValueCondition

open JapanTaxLaw.TaxFinance

example : thresholdYen = 1_000_000 := rfl
example : inScope 1_000_000 := at_limit
example : ¬ inScope 1_000_001 := above_limit
example (x : Money) : inScope x ↔ specInScope x := agree_scope x
example : thresholdYen = 1_000_000 := threshold_decoded

end JapanTaxLaw.InheritanceRegSurrenderValueCondition
