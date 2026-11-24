import JapanTaxLaw.BatchThresholdLE6cdd7bebc8Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE6cdd7bebc8

example : limit = 60000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 60000000 = meets 60000000 := agree_spec_impl 60000000
example : specMeets 60000001 = meets 60000001 := agree_spec_impl 60000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE6cdd7bebc8
