import JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThresholdSpec

/-!
# CustomsTemporaryMeasureDutyFreeThresholdTests — kernel-checked checks for 関税暫定措置法施行令 第二十七条(1)2

All checks are `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold

open JapanTaxLaw.TaxFinance

example : dutyFreePriceCeilingYen = 200_000 := rfl
example : withinDutyFreeThreshold 200_000 := at_ceiling
example : ¬ withinDutyFreeThreshold 200_001 := above_ceiling
example (p : Money) : withinDutyFreeThreshold p ↔ specWithinDutyFreeThreshold p := agree_duty_free_threshold p

end JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold
