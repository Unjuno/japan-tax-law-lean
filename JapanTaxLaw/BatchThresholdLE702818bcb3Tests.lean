import JapanTaxLaw.BatchThresholdLE702818bcb3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE702818bcb3

example : limit = 7500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 7500000 = meets 7500000 := agree_spec_impl 7500000
example : specMeets 7500001 = meets 7500001 := agree_spec_impl 7500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE702818bcb3
