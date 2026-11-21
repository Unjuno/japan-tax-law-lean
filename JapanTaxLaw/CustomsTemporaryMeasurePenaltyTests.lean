import JapanTaxLaw.CustomsTemporaryMeasurePenaltySpec

/-!
# CustomsTemporaryMeasurePenaltyTests — kernel-checked checks for 関税暫定措置法 第十六条(1)

All checks are `rfl` / `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.CustomsTemporaryMeasurePenalty

open JapanTaxLaw.TaxFinance

example : maxImprisonmentMonths = 12 := rfl
example : maxFineYen = 2_000_000 := rfl
example : withinLimits (Penalty.imprisonment 12) = true := by decide
example : withinLimits (Penalty.imprisonment 13) = false := by decide
example : withinLimits (Penalty.fine 2_000_000) = true := by decide
example : withinLimits (Penalty.fine 2_000_001) = false := by decide
example (p : Penalty) : withinLimits p = true ↔ specWithinLimits p := agree_within_limits p

end JapanTaxLaw.CustomsTemporaryMeasurePenalty
