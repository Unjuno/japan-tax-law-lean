import JapanTaxLaw.BatchThresholdGT7796e90ccaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT7796e90cca

example : limit = 5000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 5000000 = meets 5000000 := agree_spec_impl 5000000
example : specMeets 5000001 = meets 5000001 := agree_spec_impl 5000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT7796e90cca
