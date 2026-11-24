import JapanTaxLaw.BatchLowerb2ad62e72aSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLowerb2ad62e72a

example : lowerYen = 450000000 := by decide
example : meets 449999999 = false := by decide
example : meets 450000000 = true := by decide
example : specMeets 449999999 = meets 449999999 := agree_spec_impl 449999999
example : specMeets 450000000 = meets 450000000 := agree_spec_impl 450000000
example : specMeets 900000000 = meets 900000000 := agree_spec_impl 900000000

end JapanTaxLaw.BatchLowerb2ad62e72a
