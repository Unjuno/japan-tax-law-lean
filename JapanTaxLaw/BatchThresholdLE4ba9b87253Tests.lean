import JapanTaxLaw.BatchThresholdLE4ba9b87253Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE4ba9b87253

example : limit = 23500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 23500000 = meets 23500000 := agree_spec_impl 23500000
example : specMeets 23500001 = meets 23500001 := agree_spec_impl 23500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE4ba9b87253
