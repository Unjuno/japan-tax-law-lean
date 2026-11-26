import JapanTaxLaw.BatchPeriode77bae5793Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriode77bae5793

example : limit = 1 := by decide
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriode77bae5793
