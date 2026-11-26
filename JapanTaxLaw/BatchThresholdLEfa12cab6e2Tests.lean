import JapanTaxLaw.BatchThresholdLEfa12cab6e2Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEfa12cab6e2

example : limit = 2000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 2000000 = meets 2000000 := agree_spec_impl 2000000
example : specMeets 2000001 = meets 2000001 := agree_spec_impl 2000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEfa12cab6e2
