import JapanTaxLaw.BatchThresholdGTcf1a385d9fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTcf1a385d9f

example : limit = 15000000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 15000000 = meets 15000000 := agree_spec_impl 15000000
example : specMeets 15000001 = meets 15000001 := agree_spec_impl 15000001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTcf1a385d9f
