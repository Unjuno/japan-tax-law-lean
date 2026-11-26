import JapanTaxLaw.BatchThresholdGT7872c39249Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT7872c39249

example : limit = 150000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 150000 = meets 150000 := agree_spec_impl 150000
example : specMeets 150001 = meets 150001 := agree_spec_impl 150001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT7872c39249
