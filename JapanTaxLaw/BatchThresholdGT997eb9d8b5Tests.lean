import JapanTaxLaw.BatchThresholdGT997eb9d8b5Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT997eb9d8b5

example : limit = 4890000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 4890000 = meets 4890000 := agree_spec_impl 4890000
example : specMeets 4890001 = meets 4890001 := agree_spec_impl 4890001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT997eb9d8b5
