import JapanTaxLaw.BatchPeriodbf5da8b68aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchPeriodbf5da8b68a

example : limit = 1 := by decide
example : specMeets 1 = meets 1 := agree_spec_impl 1
example : specMeets 2 = meets 2 := agree_spec_impl 2
example : specMeets 0 = meets 0 := agree_spec_impl 0

end JapanTaxLaw.BatchPeriodbf5da8b68a
