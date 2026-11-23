import JapanTaxLaw.CarCountReferenceDate

/-!
# CarCountReferenceDate tests — 算定基準日 smoke checks
Decidable smoke tests, pinned to law 346M50000008013 / revision 346M50000008013_20230401_505M60000008036.
前年の四月一日。
-/

namespace JapanTaxLaw.CarCountReferenceDate

example : referenceYear 2025 = 2024 := by decide
example : referenceDate 2025 = (2024, 4, 1) := by decide
example : referenceDate 2026 = (2025, 4, 1) := by decide

end JapanTaxLaw.CarCountReferenceDate
