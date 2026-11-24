import JapanTaxLaw.BatchThresholdGT6e0ad48b2eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT6e0ad48b2e

example : limit = 3000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 3000000 = meets 3000000 := agree_spec_impl 3000000
example : specMeets 3000001 = meets 3000001 := agree_spec_impl 3000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT6e0ad48b2e
