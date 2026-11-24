import JapanTaxLaw.BatchThresholdLEb03e60a189Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEb03e60a189

example : limit = 3600000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 3600000 = meets 3600000 := agree_spec_impl 3600000
example : specMeets 3600001 = meets 3600001 := agree_spec_impl 3600001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEb03e60a189
