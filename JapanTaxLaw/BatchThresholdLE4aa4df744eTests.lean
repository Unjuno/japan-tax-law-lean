import JapanTaxLaw.BatchThresholdLE4aa4df744eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE4aa4df744e

example : limit = 2500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 2500000 = meets 2500000 := agree_spec_impl 2500000
example : specMeets 2500001 = meets 2500001 := agree_spec_impl 2500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE4aa4df744e
