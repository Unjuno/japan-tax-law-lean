import JapanTaxLaw.OrdinaryGrant94PercentSpec

/-! Boundary tests for the 94% derivation; all kernel-decided. -/
namespace JapanTaxLaw.OrdinaryGrant94Percent

open JapanTaxLaw.TaxFinance

example : grantRate.den = 100 := by decide
example : TaxRate.numDen grantRate = (94, 100) := by decide

example : ordinaryGrantTotal 0 = 0 := by decide
example : ordinaryGrantTotal 1 = 0 := by decide
example : ordinaryGrantTotal 50 = 47 := by decide
example : ordinaryGrantTotal 100 = 94 := by decide
example : ordinaryGrantTotal 10_000 = 9_400 := by decide

example : specTotal 0 = ordinaryGrantTotal 0 := agree_spec_impl 0
example : specTotal 1 = ordinaryGrantTotal 1 := agree_spec_impl 1
example : specTotal 100 = ordinaryGrantTotal 100 := agree_spec_impl 100

end JapanTaxLaw.OrdinaryGrant94Percent
