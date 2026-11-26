import JapanTaxLaw.BatchThresholdLE74798df1d0Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE74798df1d0

example : limit = 240000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 240000 = meets 240000 := agree_spec_impl 240000
example : specMeets 240001 = meets 240001 := agree_spec_impl 240001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE74798df1d0
