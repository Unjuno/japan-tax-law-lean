import JapanTaxLaw.BatchStrictUpperd4f011d4dcSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpperd4f011d4dc

example : upperYen = 10000 := by decide
example : meets 9999 = true := by decide
example : meets 10000 = false := by decide
example : specMeets 9999 = meets 9999 := agree_spec_impl 9999
example : specMeets 10000 = meets 10000 := agree_spec_impl 10000
example : specMeets 10001 = meets 10001 := agree_spec_impl 10001

end JapanTaxLaw.BatchStrictUpperd4f011d4dc
