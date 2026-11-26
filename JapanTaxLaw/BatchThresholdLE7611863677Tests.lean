import JapanTaxLaw.BatchThresholdLE7611863677Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE7611863677

example : limit = 8000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 8000000 = meets 8000000 := agree_spec_impl 8000000
example : specMeets 8000001 = meets 8000001 := agree_spec_impl 8000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE7611863677
