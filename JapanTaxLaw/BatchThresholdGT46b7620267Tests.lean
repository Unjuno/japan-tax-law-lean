import JapanTaxLaw.BatchThresholdGT46b7620267Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT46b7620267

example : limit = 5500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 5500000 = meets 5500000 := agree_spec_impl 5500000
example : specMeets 5500001 = meets 5500001 := agree_spec_impl 5500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT46b7620267
