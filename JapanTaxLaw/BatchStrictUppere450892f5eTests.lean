import JapanTaxLaw.BatchStrictUppere450892f5eSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUppere450892f5e

example : upperYen = 100 := by decide
example : meets 99 = true := by decide
example : meets 100 = false := by decide
example : specMeets 99 = meets 99 := agree_spec_impl 99
example : specMeets 100 = meets 100 := agree_spec_impl 100
example : specMeets 101 = meets 101 := agree_spec_impl 101

end JapanTaxLaw.BatchStrictUppere450892f5e
