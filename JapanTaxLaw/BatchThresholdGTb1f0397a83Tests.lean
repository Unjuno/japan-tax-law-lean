import JapanTaxLaw.BatchThresholdGTb1f0397a83Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTb1f0397a83

example : limit = 20000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 20000000 = meets 20000000 := agree_spec_impl 20000000
example : specMeets 20000001 = meets 20000001 := agree_spec_impl 20000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTb1f0397a83
