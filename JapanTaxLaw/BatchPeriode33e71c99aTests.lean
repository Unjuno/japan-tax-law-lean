import JapanTaxLaw.BatchPeriode33e71c99aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriode33e71c99a

example : limit = 7 := by decide
example : specMeets 7 = meets 7 := agree_spec_impl 7
example : specMeets 8 = meets 8 := agree_spec_impl 8
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriode33e71c99a
