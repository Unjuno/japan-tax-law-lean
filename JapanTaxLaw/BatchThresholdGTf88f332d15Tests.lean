import JapanTaxLaw.BatchThresholdGTf88f332d15Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf88f332d15

example : limit = 0 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 0 = meets 0 := agree_spec_impl 0
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf88f332d15
