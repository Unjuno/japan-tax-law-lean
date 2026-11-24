import JapanTaxLaw.BatchThresholdGTb2f4312bdaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTb2f4312bda

example : limit = 70000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 70000 = meets 70000 := agree_spec_impl 70000
example : specMeets 70001 = meets 70001 := agree_spec_impl 70001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTb2f4312bda
