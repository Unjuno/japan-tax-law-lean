import JapanTaxLaw.BatchThresholdLE630ab3d6a5Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE630ab3d6a5

example : limit = 12000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 12000 = meets 12000 := agree_spec_impl 12000
example : specMeets 12001 = meets 12001 := agree_spec_impl 12001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE630ab3d6a5
