import JapanTaxLaw.BatchStrictUpperc509bad6aaSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchStrictUpperc509bad6aa

example : upperYen = 1000 := by decide
example : meets 999 = true := by decide
example : meets 1000 = false := by decide
example : specMeets 999 = meets 999 := agree_spec_impl 999
example : specMeets 1000 = meets 1000 := agree_spec_impl 1000
example : specMeets 1001 = meets 1001 := agree_spec_impl 1001

end JapanTaxLaw.BatchStrictUpperc509bad6aa
