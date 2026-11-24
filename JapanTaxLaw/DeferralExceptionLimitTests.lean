import JapanTaxLaw.DeferralExceptionLimitSpec

/-! Boundary tests over both statutory caps; all kernel-decided. -/
namespace JapanTaxLaw.DeferralExceptionLimit

example : amountCapYen = 1_000_000 := by decide
example : periodCapYears = 3 := by decide

example : exceptionApplies 0 0 = true := by decide
example : exceptionApplies 999_999 2 = true := by decide
example : exceptionApplies 1_000_000 3 = true := by decide
example : exceptionApplies 1_000_001 3 = false := by decide
example : exceptionApplies 1_000_000 4 = false := by decide
example : exceptionApplies 1_000_001 4 = false := by decide

example : specException 1_000_000 3 = true := by decide
example : specException 1_000_001 3 = false := by decide
example : specException 1_000_000 4 = false := by decide

example : specException 1_000_000 3 = exceptionApplies 1_000_000 3 := agree_spec_impl 1_000_000 3
example : specException 1_000_001 3 = exceptionApplies 1_000_001 3 := agree_spec_impl 1_000_001 3
example : specException 1_000_000 4 = exceptionApplies 1_000_000 4 := agree_spec_impl 1_000_000 4

end JapanTaxLaw.DeferralExceptionLimit
