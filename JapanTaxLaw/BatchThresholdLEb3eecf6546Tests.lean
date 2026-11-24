import JapanTaxLaw.BatchThresholdLEb3eecf6546Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEb3eecf6546

example : limit = 100000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 100000 = meets 100000 := agree_spec_impl 100000
example : specMeets 100001 = meets 100001 := agree_spec_impl 100001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEb3eecf6546
