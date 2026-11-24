import JapanTaxLaw.BatchThresholdGT41cf37a513Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT41cf37a513

example : limit = 28000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 28000 = meets 28000 := agree_spec_impl 28000
example : specMeets 28001 = meets 28001 := agree_spec_impl 28001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT41cf37a513
