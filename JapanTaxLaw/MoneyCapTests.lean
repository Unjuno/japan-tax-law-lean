import JapanTaxLaw.MoneyCapSpec

/-! Regression tests — cap boundary and universal agreement. -/

namespace JapanTaxLaw.MoneyCap

example : capAmount 100_000_000 100_000_000 = 100_000_000 := by decide
example : capAmount 100_000_001 100_000_000 = 100_000_000 := by decide

example : capAmount 68_896_001 68_896_000 = specCap 68_896_001 68_896_000 :=
  capAmount_agrees 68_896_001 68_896_000
example : capAmount 14_999_999 15_000_000 = specCap 14_999_999 15_000_000 :=
  capAmount_agrees 14_999_999 15_000_000

end JapanTaxLaw.MoneyCap
