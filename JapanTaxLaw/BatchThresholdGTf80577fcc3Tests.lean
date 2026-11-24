import JapanTaxLaw.BatchThresholdGTf80577fcc3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf80577fcc3

example : limit = 12000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 12000000 = meets 12000000 := agree_spec_impl 12000000
example : specMeets 12000001 = meets 12000001 := agree_spec_impl 12000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf80577fcc3
