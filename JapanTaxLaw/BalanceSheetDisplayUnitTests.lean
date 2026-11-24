import JapanTaxLaw.BalanceSheetDisplayUnitSpec

/-! Boundary tests for the three presentation units; all kernel-checked. -/
namespace JapanTaxLaw.BalanceSheetDisplayUnit

example : unitDivisor DisplayUnit.oneYen = 1 := by rfl
example : unitDivisor DisplayUnit.thousandYen = 1_000 := by rfl
example : unitDivisor DisplayUnit.millionYen = 1_000_000 := by rfl

example : scaledAmount DisplayUnit.oneYen 1_234_567 = 1_234_567 := by decide
example : scaledAmount DisplayUnit.thousandYen 1_234_567 = 1_234 := by decide
example : scaledAmount DisplayUnit.millionYen 1_234_567 = 1 := by decide

example : specDivisor DisplayUnit.oneYen = unitDivisor DisplayUnit.oneYen := agree_spec_impl DisplayUnit.oneYen
example : specDivisor DisplayUnit.thousandYen = unitDivisor DisplayUnit.thousandYen := agree_spec_impl DisplayUnit.thousandYen
example : specDivisor DisplayUnit.millionYen = unitDivisor DisplayUnit.millionYen := agree_spec_impl DisplayUnit.millionYen

end JapanTaxLaw.BalanceSheetDisplayUnit
