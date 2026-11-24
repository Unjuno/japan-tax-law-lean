import JapanTaxLaw.BatchPeriod007f18a515Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod007f18a515

example : limit = 7 := by decide
example : specMeets 8 = meets 8 := agree_spec_impl 8
example : specMeets 7 = meets 7 := agree_spec_impl 7
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod007f18a515
