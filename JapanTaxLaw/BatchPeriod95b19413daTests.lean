import JapanTaxLaw.BatchPeriod95b19413daSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriod95b19413da

example : limit = 50 := by decide
example : specMeets 51 = meets 51 := agree_spec_impl 51
example : specMeets 50 = meets 50 := agree_spec_impl 50
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriod95b19413da
