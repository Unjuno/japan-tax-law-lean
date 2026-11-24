import JapanTaxLaw.BatchThresholdGT6a755d2bccSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT6a755d2bcc

example : limit = 1300000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1300000 = meets 1300000 := agree_spec_impl 1300000
example : specMeets 1300001 = meets 1300001 := agree_spec_impl 1300001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT6a755d2bcc
