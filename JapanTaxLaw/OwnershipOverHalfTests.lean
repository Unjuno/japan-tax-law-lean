import JapanTaxLaw.OwnershipOverHalfSpec

/-! Boundary tests for the strict 50% threshold; all kernel-decided. -/
namespace JapanTaxLaw.OwnershipOverHalf

example : thresholdPercent = 50 := by decide
example : percentBase = 100 := by decide

example : exceedsHalf 0 100 = false := by decide
example : exceedsHalf 49 100 = false := by decide
example : exceedsHalf 50 100 = false := by decide
example : exceedsHalf 51 100 = true := by decide
example : exceedsHalf 1 2 = false := by decide
example : exceedsHalf 5_001 10_000 = true := by decide

example : specWithinHalf 50 100 = !exceedsHalf 50 100 := agree_spec_impl 50 100
example : specWithinHalf 51 100 = !exceedsHalf 51 100 := agree_spec_impl 51 100

end JapanTaxLaw.OwnershipOverHalf
