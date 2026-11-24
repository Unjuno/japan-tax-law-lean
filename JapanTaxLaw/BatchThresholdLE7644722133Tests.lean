import JapanTaxLaw.BatchThresholdLE7644722133Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE7644722133

example : limit = 300000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 300000 = meets 300000 := agree_spec_impl 300000
example : specMeets 300001 = meets 300001 := agree_spec_impl 300001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE7644722133
