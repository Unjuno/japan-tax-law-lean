import JapanTaxLaw.BatchThresholdLEe32ef8d87dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEe32ef8d87d

example : limit = 3300000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 3300000 = meets 3300000 := agree_spec_impl 3300000
example : specMeets 3300001 = meets 3300001 := agree_spec_impl 3300001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEe32ef8d87d
