import JapanTaxLaw.BatchThresholdLE288c55f94fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE288c55f94f

example : limit = 200000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 200000000 = meets 200000000 := agree_spec_impl 200000000
example : specMeets 200000001 = meets 200000001 := agree_spec_impl 200000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE288c55f94f
