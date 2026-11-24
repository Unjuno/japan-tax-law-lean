import JapanTaxLaw.BatchThresholdGT2b7f260121Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT2b7f260121

example : limit = 30000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 30000000 = meets 30000000 := agree_spec_impl 30000000
example : specMeets 30000001 = meets 30000001 := agree_spec_impl 30000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT2b7f260121
