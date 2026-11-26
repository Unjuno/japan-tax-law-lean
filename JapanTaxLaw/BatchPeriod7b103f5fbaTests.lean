import JapanTaxLaw.BatchPeriod7b103f5fbaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod7b103f5fba

example : limit = 10 := by decide
example : specMeets 10 = meets 10 := agree_spec_impl 10
example : specMeets 11 = meets 11 := agree_spec_impl 11
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod7b103f5fba
