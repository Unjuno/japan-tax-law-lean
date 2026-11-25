import JapanTaxLaw.BatchStrictUpperdbd479b3b9Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpperdbd479b3b9

example : upperYen = 30000 := by decide
example : meets 29999 = true := by decide
example : meets 30000 = false := by decide
example : specMeets 29999 = meets 29999 := agree_spec_impl 29999
example : specMeets 30000 = meets 30000 := agree_spec_impl 30000
example : specMeets 30001 = meets 30001 := agree_spec_impl 30001

end JapanTaxLaw.BatchStrictUpperdbd479b3b9
