import JapanTaxLaw.BatchThresholdLE31f9a56381Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE31f9a56381

example : limit = 500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 500000 = meets 500000 := agree_spec_impl 500000
example : specMeets 500001 = meets 500001 := agree_spec_impl 500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE31f9a56381
