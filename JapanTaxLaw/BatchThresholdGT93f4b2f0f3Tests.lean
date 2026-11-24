import JapanTaxLaw.BatchThresholdGT93f4b2f0f3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT93f4b2f0f3

example : limit = 60000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 60000000 = meets 60000000 := agree_spec_impl 60000000
example : specMeets 60000001 = meets 60000001 := agree_spec_impl 60000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT93f4b2f0f3
