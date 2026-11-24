import JapanTaxLaw.BatchLowera0f8136555Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowera0f8136555

example : lowerYen = 600000 := by decide
example : meets 599999 = false := by decide
example : meets 600000 = true := by decide
example : specMeets 599999 = meets 599999 := agree_spec_impl 599999
example : specMeets 600000 = meets 600000 := agree_spec_impl 600000
example : specMeets 1200000 = meets 1200000 := agree_spec_impl 1200000

end JapanTaxLaw.BatchLowera0f8136555
