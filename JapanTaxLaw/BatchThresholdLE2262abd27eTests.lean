import JapanTaxLaw.BatchThresholdLE2262abd27eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE2262abd27e

example : limit = 50000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 50000 = meets 50000 := agree_spec_impl 50000
example : specMeets 50001 = meets 50001 := agree_spec_impl 50001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE2262abd27e
