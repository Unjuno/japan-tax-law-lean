import JapanTaxLaw.BatchPeriod8865d40cadSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod8865d40cad

example : limit = 4 := by decide
example : specMeets 5 = meets 5 := agree_spec_impl 5
example : specMeets 4 = meets 4 := agree_spec_impl 4
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod8865d40cad
