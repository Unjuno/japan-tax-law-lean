import JapanTaxLaw.BatchThresholdLEd8bb9d6d5cSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEd8bb9d6d5c

example : limit = 3000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 3000000 = meets 3000000 := agree_spec_impl 3000000
example : specMeets 3000001 = meets 3000001 := agree_spec_impl 3000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEd8bb9d6d5c
