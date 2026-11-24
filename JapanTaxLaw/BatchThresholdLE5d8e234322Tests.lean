import JapanTaxLaw.BatchThresholdLE5d8e234322Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE5d8e234322

example : limit = 200000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 200000 = meets 200000 := agree_spec_impl 200000
example : specMeets 200001 = meets 200001 := agree_spec_impl 200001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE5d8e234322
