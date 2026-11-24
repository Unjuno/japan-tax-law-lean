import JapanTaxLaw.BatchLowerb759012336Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowerb759012336

example : lowerYen = 380000 := by decide
example : meets 379999 = false := by decide
example : meets 380000 = true := by decide
example : specMeets 379999 = meets 379999 := agree_spec_impl 379999
example : specMeets 380000 = meets 380000 := agree_spec_impl 380000
example : specMeets 760000 = meets 760000 := agree_spec_impl 760000

end JapanTaxLaw.BatchLowerb759012336
