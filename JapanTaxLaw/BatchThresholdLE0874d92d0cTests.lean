import JapanTaxLaw.BatchThresholdLE0874d92d0cSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE0874d92d0c

example : limit = 3000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 3000000 = meets 3000000 := agree_spec_impl 3000000
example : specMeets 3000001 = meets 3000001 := agree_spec_impl 3000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE0874d92d0c
