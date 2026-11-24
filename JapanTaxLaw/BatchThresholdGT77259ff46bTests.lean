import JapanTaxLaw.BatchThresholdGT77259ff46bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT77259ff46b

example : limit = 2000000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 2000000000 = meets 2000000000 := agree_spec_impl 2000000000
example : specMeets 2000000001 = meets 2000000001 := agree_spec_impl 2000000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT77259ff46b
