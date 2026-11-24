import JapanTaxLaw.BatchPeriodb460032107Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodb460032107

example : limit = 60 := by decide
example : specMeets 60 = meets 60 := agree_spec_impl 60
example : specMeets 61 = meets 61 := agree_spec_impl 61
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodb460032107
