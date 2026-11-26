import JapanTaxLaw.PeriodAllocationSpec

/-! Regression tests — per-period allocation boundary and uniqueness. -/

namespace JapanTaxLaw.PeriodAllocation

example : perUnit 1200 4 = 300 := by decide
example : perUnit 1201 4 = 300 := by decide

example : PerUnitSpec 1201 4 300 := by
  unfold PerUnitSpec
  constructor <;> decide

example : perUnit 1201 4 = 300 := by
  exact perUnit_unique 1201 4 300 (by decide) (by
    unfold PerUnitSpec
    constructor <;> decide)

example : perUnit 1201 4 = 300 := by decide

end JapanTaxLaw.PeriodAllocation
