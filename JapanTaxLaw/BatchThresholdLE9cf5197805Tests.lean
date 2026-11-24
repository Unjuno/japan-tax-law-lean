import JapanTaxLaw.BatchThresholdLE9cf5197805Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE9cf5197805

example : limit = 24000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 24000000 = meets 24000000 := agree_spec_impl 24000000
example : specMeets 24000001 = meets 24000001 := agree_spec_impl 24000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE9cf5197805
