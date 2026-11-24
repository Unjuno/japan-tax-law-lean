import JapanTaxLaw.BatchThresholdGT4c03f0a41fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT4c03f0a41f

example : limit = 5500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 5500000 = meets 5500000 := agree_spec_impl 5500000
example : specMeets 5500001 = meets 5500001 := agree_spec_impl 5500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT4c03f0a41f
