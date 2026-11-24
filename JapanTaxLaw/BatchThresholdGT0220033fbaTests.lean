import JapanTaxLaw.BatchThresholdGT0220033fbaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT0220033fba

example : limit = 30000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 30000000 = meets 30000000 := agree_spec_impl 30000000
example : specMeets 30000001 = meets 30000001 := agree_spec_impl 30000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT0220033fba
