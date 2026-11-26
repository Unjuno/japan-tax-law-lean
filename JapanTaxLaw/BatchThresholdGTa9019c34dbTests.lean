import JapanTaxLaw.BatchThresholdGTa9019c34dbSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchThresholdGTa9019c34db

example : limit = 150000 := by decide
example : meets 0 = meets 0 := rfl
example : specMeets 150000 = meets 150000 := agree_spec_impl 150000
example : specMeets 150001 = meets 150001 := agree_spec_impl 150001
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchThresholdGTa9019c34db
