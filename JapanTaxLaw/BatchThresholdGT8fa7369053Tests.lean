import JapanTaxLaw.BatchThresholdGT8fa7369053Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT8fa7369053

example : limit = 32000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 32000000 = meets 32000000 := agree_spec_impl 32000000
example : specMeets 32000001 = meets 32000001 := agree_spec_impl 32000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT8fa7369053
