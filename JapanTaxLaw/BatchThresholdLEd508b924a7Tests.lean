import JapanTaxLaw.BatchThresholdLEd508b924a7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEd508b924a7

example : limit = 2500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 2500000 = meets 2500000 := agree_spec_impl 2500000
example : specMeets 2500001 = meets 2500001 := agree_spec_impl 2500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEd508b924a7
