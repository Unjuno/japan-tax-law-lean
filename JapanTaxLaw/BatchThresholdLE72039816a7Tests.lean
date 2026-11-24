import JapanTaxLaw.BatchThresholdLE72039816a7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE72039816a7

example : limit = 20000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 20000000 = meets 20000000 := agree_spec_impl 20000000
example : specMeets 20000001 = meets 20000001 := agree_spec_impl 20000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE72039816a7
