import JapanTaxLaw.BatchThresholdLEdaafd3a32aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEdaafd3a32a

example : limit = 4000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 4000000 = meets 4000000 := agree_spec_impl 4000000
example : specMeets 4000001 = meets 4000001 := agree_spec_impl 4000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEdaafd3a32a
