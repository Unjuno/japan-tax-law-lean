import JapanTaxLaw.ProportionalAllocationSpec

/-! Regression tests — pro-rata boundaries and universal agreement. -/

namespace JapanTaxLaw.ProportionalAllocation

example : allocate 1_000 1 3 = 333 := by decide
example : allocate 1_000 1 0 = 0 := by decide
example : allocate 1_000 3 10 = specAllocate 1_000 3 10 := agrees 1_000 3 10 (by decide)

end JapanTaxLaw.ProportionalAllocation
