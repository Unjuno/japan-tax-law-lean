import JapanTaxLaw.BatchThresholdGT7f86f5803eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT7f86f5803e

example : limit = 6000000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 6000000000 = meets 6000000000 := agree_spec_impl 6000000000
example : specMeets 6000000001 = meets 6000000001 := agree_spec_impl 6000000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT7f86f5803e
