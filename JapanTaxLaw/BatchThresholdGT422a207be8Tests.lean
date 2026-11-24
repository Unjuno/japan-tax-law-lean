import JapanTaxLaw.BatchThresholdGT422a207be8Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT422a207be8

example : limit = 1300000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1300000 = meets 1300000 := agree_spec_impl 1300000
example : specMeets 1300001 = meets 1300001 := agree_spec_impl 1300001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT422a207be8
