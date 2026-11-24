import JapanTaxLaw.BatchThresholdGT8220ff476aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT8220ff476a

example : limit = 8500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 8500000 = meets 8500000 := agree_spec_impl 8500000
example : specMeets 8500001 = meets 8500001 := agree_spec_impl 8500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT8220ff476a
