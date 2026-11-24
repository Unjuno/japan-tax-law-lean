import JapanTaxLaw.BatchThresholdLE152adee2c0Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdLE152adee2c0

example : limit = 300000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 300000000 = meets 300000000 := agree_spec_impl 300000000
example : specMeets 300000001 = meets 300000001 := agree_spec_impl 300000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdLE152adee2c0
