import JapanTaxLaw.BatchThresholdLE50c7e30817Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE50c7e30817

example : limit = 25000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 25000000 = meets 25000000 := agree_spec_impl 25000000
example : specMeets 25000001 = meets 25000001 := agree_spec_impl 25000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE50c7e30817
