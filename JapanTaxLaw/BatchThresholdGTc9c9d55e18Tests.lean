import JapanTaxLaw.BatchThresholdGTc9c9d55e18Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTc9c9d55e18

example : limit = 9000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 9000000 = meets 9000000 := agree_spec_impl 9000000
example : specMeets 9000001 = meets 9000001 := agree_spec_impl 9000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTc9c9d55e18
