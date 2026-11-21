import JapanTaxLaw.LocalTaxArt21PenaltySpec

/-!
# LocalTaxArt21PenaltyTests — kernel-checked checks for 地方税法 第二十一条(1)（罰則）

All checks are `by decide` / theorem application, kernel-checked.
-/

namespace JapanTaxLaw.LocalTaxArt21Penalty

open JapanTaxLaw.TaxFinance

example : maxImprisonmentMonths = 36 := by decide
example : maxFineYen = 200_000 := by decide
example : withinLimits (Penalty.imprisonment 36) = true := by decide
example : withinLimits (Penalty.imprisonment 37) = false := by decide
example : withinLimits (Penalty.fine 200_000) = true := by decide
example : withinLimits (Penalty.fine 200_001) = false := by decide
example (p : Penalty) : withinLimits p = true ↔ specWithinLimits p := agree_within_limits p

end JapanTaxLaw.LocalTaxArt21Penalty
