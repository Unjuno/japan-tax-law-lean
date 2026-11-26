import JapanTaxLaw.BatchThresholdGT058d21042fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT058d21042f

example : limit = 50000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 50000000 = meets 50000000 := agree_spec_impl 50000000
example : specMeets 50000001 = meets 50000001 := agree_spec_impl 50000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT058d21042f
