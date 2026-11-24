import JapanTaxLaw.BatchThresholdLEe969c64254Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLEe969c64254

example : limit = 1500000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 1500000 = meets 1500000 := agree_spec_impl 1500000
example : specMeets 1500001 = meets 1500001 := agree_spec_impl 1500001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLEe969c64254
