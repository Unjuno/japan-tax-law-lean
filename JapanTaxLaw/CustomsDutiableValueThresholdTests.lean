import JapanTaxLaw.CustomsDutiableValueThresholdSpec

/-!
# CustomsDutiableValueThresholdTests — kernel-checked checks for 関税定率法施行令 第一条の二(1)第三号

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.CustomsDutiableValueThreshold

open JapanTaxLaw.TaxFinance

example : thresholdYen = 100_000 := rfl
example : ¬ aboveThreshold 100_000 := threshold_exclusive
example : aboveThreshold 100_001 := first_above
example (x : Money) : aboveThreshold x ↔ specAboveThreshold x := agree_threshold x
example : thresholdYen = 100_000 := threshold_decoded

end JapanTaxLaw.CustomsDutiableValueThreshold
