import JapanTaxLaw.BatchPeriode5f1a6f9d3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriode5f1a6f9d3

example : limit = 2 := by decide
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 3 = meets 3 := agree_spec_impl 3
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriode5f1a6f9d3
