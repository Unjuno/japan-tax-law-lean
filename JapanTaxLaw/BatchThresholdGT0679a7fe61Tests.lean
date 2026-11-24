import JapanTaxLaw.BatchThresholdGT0679a7fe61Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT0679a7fe61

example : limit = 100000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 100000 = meets 100000 := agree_spec_impl 100000
example : specMeets 100001 = meets 100001 := agree_spec_impl 100001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT0679a7fe61
