import JapanTaxLaw.BatchThresholdGT40c4acac1fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT40c4acac1f

example : limit = 18050000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 18050000 = meets 18050000 := agree_spec_impl 18050000
example : specMeets 18050001 = meets 18050001 := agree_spec_impl 18050001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT40c4acac1f
