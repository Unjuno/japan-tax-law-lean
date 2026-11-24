import JapanTaxLaw.BatchThresholdLEc8905755acSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEc8905755ac

example : limit = 950000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 950000 = meets 950000 := agree_spec_impl 950000
example : specMeets 950001 = meets 950001 := agree_spec_impl 950001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEc8905755ac
