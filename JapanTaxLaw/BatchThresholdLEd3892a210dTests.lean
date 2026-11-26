import JapanTaxLaw.BatchThresholdLEd3892a210dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEd3892a210d

example : limit = 640000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 640000 = meets 640000 := agree_spec_impl 640000
example : specMeets 640001 = meets 640001 := agree_spec_impl 640001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEd3892a210d
