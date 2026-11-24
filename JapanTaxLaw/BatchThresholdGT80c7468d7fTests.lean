import JapanTaxLaw.BatchThresholdGT80c7468d7fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT80c7468d7f

example : limit = 50000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 50000 = meets 50000 := agree_spec_impl 50000
example : specMeets 50001 = meets 50001 := agree_spec_impl 50001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT80c7468d7f
