import JapanTaxLaw.BatchThresholdGT7aee4281b9Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT7aee4281b9

example : limit = 1200 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1200 = meets 1200 := agree_spec_impl 1200
example : specMeets 1201 = meets 1201 := agree_spec_impl 1201
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT7aee4281b9
