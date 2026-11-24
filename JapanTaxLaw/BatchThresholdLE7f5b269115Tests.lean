import JapanTaxLaw.BatchThresholdLE7f5b269115Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE7f5b269115

example : limit = 1900000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1900000 = meets 1900000 := agree_spec_impl 1900000
example : specMeets 1900001 = meets 1900001 := agree_spec_impl 1900001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE7f5b269115
