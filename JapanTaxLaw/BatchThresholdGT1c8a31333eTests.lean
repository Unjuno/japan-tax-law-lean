import JapanTaxLaw.BatchThresholdGT1c8a31333eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT1c8a31333e

example : limit = 5000000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 5000000000 = meets 5000000000 := agree_spec_impl 5000000000
example : specMeets 5000000001 = meets 5000000001 := agree_spec_impl 5000000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT1c8a31333e
