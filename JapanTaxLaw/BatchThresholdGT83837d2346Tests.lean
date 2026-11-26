import JapanTaxLaw.BatchThresholdGT83837d2346Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT83837d2346

example : limit = 100000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 100000 = meets 100000 := agree_spec_impl 100000
example : specMeets 100001 = meets 100001 := agree_spec_impl 100001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT83837d2346
