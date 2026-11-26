import JapanTaxLaw.BatchPeriodb34b8165beSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodb34b8165be

example : limit = 10 := by decide
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 10 = meets 10 := agree_spec_impl 10
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodb34b8165be
