import JapanTaxLaw.BatchLoweraa759a43a3Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLoweraa759a43a3

example : lowerYen = 5000000000 := by decide
example : meets 4999999999 = false := by decide
example : meets 5000000000 = true := by decide
example : specMeets 4999999999 = meets 4999999999 := agree_spec_impl 4999999999
example : specMeets 5000000000 = meets 5000000000 := agree_spec_impl 5000000000
example : specMeets 10000000000 = meets 10000000000 := agree_spec_impl 10000000000

end JapanTaxLaw.BatchLoweraa759a43a3
