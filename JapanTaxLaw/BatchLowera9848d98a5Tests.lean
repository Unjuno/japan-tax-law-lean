import JapanTaxLaw.BatchLowera9848d98a5Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowera9848d98a5

example : lowerYen = 20000000 := by decide
example : meets 19999999 = false := by decide
example : meets 20000000 = true := by decide
example : specMeets 19999999 = meets 19999999 := agree_spec_impl 19999999
example : specMeets 20000000 = meets 20000000 := agree_spec_impl 20000000
example : specMeets 40000000 = meets 40000000 := agree_spec_impl 40000000

end JapanTaxLaw.BatchLowera9848d98a5
