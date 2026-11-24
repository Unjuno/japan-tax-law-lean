import JapanTaxLaw.BatchThresholdGTd3e76984fcSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTd3e76984fc

example : limit = 120000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 120000 = meets 120000 := agree_spec_impl 120000
example : specMeets 120001 = meets 120001 := agree_spec_impl 120001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTd3e76984fc
