import JapanTaxLaw.BatchLower0b962c04bdSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower0b962c04bd

example : lowerYen = 100000000 := by decide
example : meets 99999999 = false := by decide
example : meets 100000000 = true := by decide
example : specMeets 99999999 = meets 99999999 := agree_spec_impl 99999999
example : specMeets 100000000 = meets 100000000 := agree_spec_impl 100000000
example : specMeets 200000000 = meets 200000000 := agree_spec_impl 200000000

end JapanTaxLaw.BatchLower0b962c04bd
