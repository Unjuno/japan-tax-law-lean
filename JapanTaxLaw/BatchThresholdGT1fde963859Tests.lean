import JapanTaxLaw.BatchThresholdGT1fde963859Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT1fde963859

example : limit = 40000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 40000000 = meets 40000000 := agree_spec_impl 40000000
example : specMeets 40000001 = meets 40000001 := agree_spec_impl 40000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT1fde963859
