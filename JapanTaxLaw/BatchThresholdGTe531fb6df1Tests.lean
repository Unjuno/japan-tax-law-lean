import JapanTaxLaw.BatchThresholdGTe531fb6df1Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTe531fb6df1

example : limit = 1350000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1350000 = meets 1350000 := agree_spec_impl 1350000
example : specMeets 1350001 = meets 1350001 := agree_spec_impl 1350001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTe531fb6df1
