import JapanTaxLaw.BatchStrictUpperbc3db8a9d4Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpperbc3db8a9d4

example : upperYen = 10000000 := by decide
example : meets 9999999 = true := by decide
example : meets 10000000 = false := by decide
example : specMeets 9999999 = meets 9999999 := agree_spec_impl 9999999
example : specMeets 10000000 = meets 10000000 := agree_spec_impl 10000000
example : specMeets 10000001 = meets 10000001 := agree_spec_impl 10000001

end JapanTaxLaw.BatchStrictUpperbc3db8a9d4
