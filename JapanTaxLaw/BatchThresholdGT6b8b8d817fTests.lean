import JapanTaxLaw.BatchThresholdGT6b8b8d817fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT6b8b8d817f

example : limit = 9000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 9000000 = meets 9000000 := agree_spec_impl 9000000
example : specMeets 9000001 = meets 9000001 := agree_spec_impl 9000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT6b8b8d817f
