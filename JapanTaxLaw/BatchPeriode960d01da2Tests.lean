import JapanTaxLaw.BatchPeriode960d01da2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriode960d01da2

example : limit = 55 := by decide
example : specMeets 55 = meets 55 := agree_spec_impl 55
example : specMeets 56 = meets 56 := agree_spec_impl 56
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriode960d01da2
