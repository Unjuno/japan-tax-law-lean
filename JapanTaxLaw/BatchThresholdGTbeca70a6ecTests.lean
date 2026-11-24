import JapanTaxLaw.BatchThresholdGTbeca70a6ecSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTbeca70a6ec

example : limit = 3000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 3000000 = meets 3000000 := agree_spec_impl 3000000
example : specMeets 3000001 = meets 3000001 := agree_spec_impl 3000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTbeca70a6ec
