import JapanTaxLaw.BatchThresholdGT3cc8a2ede1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT3cc8a2ede1

example : limit = 100000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 100000000 = meets 100000000 := agree_spec_impl 100000000
example : specMeets 100000001 = meets 100000001 := agree_spec_impl 100000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT3cc8a2ede1
