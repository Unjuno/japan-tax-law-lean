import JapanTaxLaw.BatchThresholdGTf93dca84e7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf93dca84e7

example : limit = 4000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 4000000 = meets 4000000 := agree_spec_impl 4000000
example : specMeets 4000001 = meets 4000001 := agree_spec_impl 4000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf93dca84e7
