import JapanTaxLaw.BatchThresholdGTce65c96c7eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTce65c96c7e

example : limit = 25000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 25000 = meets 25000 := agree_spec_impl 25000
example : specMeets 25001 = meets 25001 := agree_spec_impl 25001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTce65c96c7e
