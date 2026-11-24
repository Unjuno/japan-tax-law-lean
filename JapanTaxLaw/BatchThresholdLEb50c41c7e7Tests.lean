import JapanTaxLaw.BatchThresholdLEb50c41c7e7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEb50c41c7e7

example : limit = 1000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1000 = meets 1000 := agree_spec_impl 1000
example : specMeets 1001 = meets 1001 := agree_spec_impl 1001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEb50c41c7e7
