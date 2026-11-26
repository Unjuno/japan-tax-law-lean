import JapanTaxLaw.BatchThresholdGT884957637aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT884957637a

example : limit = 5000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 5000 = meets 5000 := agree_spec_impl 5000
example : specMeets 5001 = meets 5001 := agree_spec_impl 5001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT884957637a
