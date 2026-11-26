import JapanTaxLaw.BatchThresholdGT2417a751acSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT2417a751ac

example : limit = 1350000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1350000 = meets 1350000 := agree_spec_impl 1350000
example : specMeets 1350001 = meets 1350001 := agree_spec_impl 1350001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT2417a751ac
