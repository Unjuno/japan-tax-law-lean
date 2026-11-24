import JapanTaxLaw.BatchThresholdGTf16147d7e4Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTf16147d7e4

example : limit = 40000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 40000 = meets 40000 := agree_spec_impl 40000
example : specMeets 40001 = meets 40001 := agree_spec_impl 40001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTf16147d7e4
