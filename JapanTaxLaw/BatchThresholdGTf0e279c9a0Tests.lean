import JapanTaxLaw.BatchThresholdGTf0e279c9a0Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf0e279c9a0

example : limit = 18000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 18000000 = meets 18000000 := agree_spec_impl 18000000
example : specMeets 18000001 = meets 18000001 := agree_spec_impl 18000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf0e279c9a0
