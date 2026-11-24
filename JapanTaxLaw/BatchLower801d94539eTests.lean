import JapanTaxLaw.BatchLower801d94539eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower801d94539e

example : lowerYen = 5000000 := by decide
example : meets 4999999 = false := by decide
example : meets 5000000 = true := by decide
example : specMeets 4999999 = meets 4999999 := agree_spec_impl 4999999
example : specMeets 5000000 = meets 5000000 := agree_spec_impl 5000000
example : specMeets 10000000 = meets 10000000 := agree_spec_impl 10000000

end JapanTaxLaw.BatchLower801d94539e
