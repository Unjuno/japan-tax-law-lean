import JapanTaxLaw.InheritanceTax

/-!
# InheritanceTax tests — 相続税法 art. 15/16 smoke checks

Decidable smoke tests for the 相続税の総額 + 基礎控除 model, pinned to
  Law id: 325AC0000000073
  Revision: 325AC0000000073_20260401_506AC0000000008
  Amendment enforcement date: 2026-04-01

Boundary and sample values for the art. 16 progressive table and the
art. 15 deduction, plus the adoption-count rules.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 16 table boundaries
example : inheritedPortionTax 0 = 0 := by decide
example : inheritedPortionTax 10_000_000 = 1_000_000 := by decide
example : inheritedPortionTax 20_000_000 = 2_500_000 := by decide
example : inheritedPortionTax 30_000_000 = 4_000_000 := by decide
example : inheritedPortionTax 50_000_000 = 8_000_000 := by decide
example : inheritedPortionTax 100_000_000 = 23_000_000 := by decide
example : inheritedPortionTax 200_000_000 = 63_000_000 := by decide
example : inheritedPortionTax 300_000_000 = 108_000_000 := by decide
example : inheritedPortionTax 600_000_000 = 258_000_000 := by decide
example : inheritedPortionTax 700_000_000 = 313_000_000 := by decide
example : inheritedPortionTax 1_000_000_000 = 478_000_000 := by decide

-- interior sample
example : inheritedPortionTax 5_000_000 = 500_000 := by decide
example : inheritedPortionTax 150_000_000 = 43_000_000 := by decide

-- art. 15 deduction
example : inheritanceBasicDeduction 0 = 30_000_000 := by decide
example : inheritanceBasicDeduction 1 = 36_000_000 := by decide
example : inheritanceBasicDeduction 2 = 42_000_000 := by decide
example : inheritanceBasicDeduction 4 = 54_000_000 := by decide

-- art. 15(2) adoption-count limit
example : limitedAdoptedHeirs 2 5 = 3 := by decide
example : limitedAdoptedHeirs 1 0 = 1 := by decide
example : limitedAdoptedHeirs 0 1 = 1 := by decide
example : limitedAdoptedHeirs 0 2 = 2 := by decide
example : limitedAdoptedHeirs 0 3 = 2 := by decide
example : limitedAdoptedHeirs 3 1 = 4 := by decide

-- spouse+children composite
example : spouseAndChildrenTotalTax 0 0 0 = 0 := by decide
example : spouseAndChildrenTotalTax 100_000_000 2 2
    = inheritedPortionTax 29_000_000 + 2 * inheritedPortionTax 14_500_000
    := by decide
example : spouseAndChildrenTotalTax 100_000_000 2 2 = 7_200_000 := by decide
example : spouseAndChildrenTotalTax 0 4 2 = 0 := by decide

end JapanTaxLaw
