import JapanTaxLaw.BatchStrictUpper9553ab2530Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpper9553ab2530

example : upperYen = 300000000 := by decide
example : meets 299999999 = true := by decide
example : meets 300000000 = false := by decide
example : specMeets 299999999 = meets 299999999 := agree_spec_impl 299999999
example : specMeets 300000000 = meets 300000000 := agree_spec_impl 300000000
example : specMeets 300000001 = meets 300000001 := agree_spec_impl 300000001

end JapanTaxLaw.BatchStrictUpper9553ab2530
