import JapanTaxLaw.BatchThresholdGTd1b0d0a11eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTd1b0d0a11e

example : limit = 80000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 80000 = meets 80000 := agree_spec_impl 80000
example : specMeets 80001 = meets 80001 := agree_spec_impl 80001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTd1b0d0a11e
