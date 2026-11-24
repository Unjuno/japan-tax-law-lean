import JapanTaxLaw.BatchPeriode0df6bf132Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriode0df6bf132

example : limit = 30 := by decide
example : specMeets 30 = meets 30 := agree_spec_impl 30
example : specMeets 31 = meets 31 := agree_spec_impl 31
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriode0df6bf132
