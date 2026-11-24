import JapanTaxLaw.BatchThresholdLEfe9224a126Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEfe9224a126

example : limit = 10000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 10000 = meets 10000 := agree_spec_impl 10000
example : specMeets 10001 = meets 10001 := agree_spec_impl 10001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEfe9224a126
