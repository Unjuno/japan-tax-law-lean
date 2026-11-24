import JapanTaxLaw.BatchThresholdGTcf500d7e5dSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTcf500d7e5d

example : limit = 650000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 650000 = meets 650000 := agree_spec_impl 650000
example : specMeets 650001 = meets 650001 := agree_spec_impl 650001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTcf500d7e5d
