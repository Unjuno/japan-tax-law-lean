import JapanTaxLaw.BatchThresholdGT40d4b34649Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT40d4b34649

example : limit = 4500000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 4500000000 = meets 4500000000 := agree_spec_impl 4500000000
example : specMeets 4500000001 = meets 4500000001 := agree_spec_impl 4500000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT40d4b34649
