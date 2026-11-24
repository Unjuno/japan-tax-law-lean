import JapanTaxLaw.BatchThresholdGTe7d6df6bf6Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTe7d6df6bf6

example : limit = 30000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 30000 = meets 30000 := agree_spec_impl 30000
example : specMeets 30001 = meets 30001 := agree_spec_impl 30001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTe7d6df6bf6
