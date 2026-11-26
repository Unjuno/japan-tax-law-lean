import JapanTaxLaw.BatchThresholdGT1415fac536Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGT1415fac536

example : limit = 0 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 0 = meets 0 := agree_spec_impl 0
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGT1415fac536
