import JapanTaxLaw.BatchThresholdGT7e7bf7a690Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT7e7bf7a690

example : limit = 56000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 56000 = meets 56000 := agree_spec_impl 56000
example : specMeets 56001 = meets 56001 := agree_spec_impl 56001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT7e7bf7a690
