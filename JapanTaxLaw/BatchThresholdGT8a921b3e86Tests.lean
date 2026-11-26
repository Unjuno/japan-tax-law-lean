import JapanTaxLaw.BatchThresholdGT8a921b3e86Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT8a921b3e86

example : limit = 1200000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1200000 = meets 1200000 := agree_spec_impl 1200000
example : specMeets 1200001 = meets 1200001 := agree_spec_impl 1200001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT8a921b3e86
