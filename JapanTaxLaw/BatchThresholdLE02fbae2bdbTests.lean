import JapanTaxLaw.BatchThresholdLE02fbae2bdbSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE02fbae2bdb

example : limit = 1000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1000000 = meets 1000000 := agree_spec_impl 1000000
example : specMeets 1000001 = meets 1000001 := agree_spec_impl 1000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE02fbae2bdb
