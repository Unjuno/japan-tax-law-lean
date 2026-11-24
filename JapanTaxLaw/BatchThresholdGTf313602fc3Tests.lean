import JapanTaxLaw.BatchThresholdGTf313602fc3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf313602fc3

example : limit = 70000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 70000 = meets 70000 := agree_spec_impl 70000
example : specMeets 70001 = meets 70001 := agree_spec_impl 70001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf313602fc3
