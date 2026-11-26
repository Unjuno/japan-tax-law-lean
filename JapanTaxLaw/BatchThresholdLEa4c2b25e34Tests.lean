import JapanTaxLaw.BatchThresholdLEa4c2b25e34Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEa4c2b25e34

example : limit = 1100000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1100000 = meets 1100000 := agree_spec_impl 1100000
example : specMeets 1100001 = meets 1100001 := agree_spec_impl 1100001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEa4c2b25e34
