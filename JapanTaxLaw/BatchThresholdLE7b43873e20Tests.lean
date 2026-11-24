import JapanTaxLaw.BatchThresholdLE7b43873e20Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE7b43873e20

example : limit = 12000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 12000 = meets 12000 := agree_spec_impl 12000
example : specMeets 12001 = meets 12001 := agree_spec_impl 12001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE7b43873e20
