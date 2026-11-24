import JapanTaxLaw.BatchThresholdGT80a9f3339dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT80a9f3339d

example : limit = 300000000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 300000000000 = meets 300000000000 := agree_spec_impl 300000000000
example : specMeets 300000000001 = meets 300000000001 := agree_spec_impl 300000000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT80a9f3339d
