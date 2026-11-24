import JapanTaxLaw.BatchThresholdLEab408ac092Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEab408ac092

example : limit = 1950000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1950000 = meets 1950000 := agree_spec_impl 1950000
example : specMeets 1950001 = meets 1950001 := agree_spec_impl 1950001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEab408ac092
