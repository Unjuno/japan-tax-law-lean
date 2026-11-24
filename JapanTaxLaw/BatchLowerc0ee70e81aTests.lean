import JapanTaxLaw.BatchLowerc0ee70e81aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowerc0ee70e81a

example : lowerYen = 1000000 := by decide
example : meets 999999 = false := by decide
example : meets 1000000 = true := by decide
example : specMeets 999999 = meets 999999 := agree_spec_impl 999999
example : specMeets 1000000 = meets 1000000 := agree_spec_impl 1000000
example : specMeets 2000000 = meets 2000000 := agree_spec_impl 2000000

end JapanTaxLaw.BatchLowerc0ee70e81a
