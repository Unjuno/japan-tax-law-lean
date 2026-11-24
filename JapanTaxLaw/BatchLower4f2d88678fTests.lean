import JapanTaxLaw.BatchLower4f2d88678fSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower4f2d88678f

example : lowerYen = 10000 := by decide
example : meets 9999 = false := by decide
example : meets 10000 = true := by decide
example : specMeets 9999 = meets 9999 := agree_spec_impl 9999
example : specMeets 10000 = meets 10000 := agree_spec_impl 10000
example : specMeets 20000 = meets 20000 := agree_spec_impl 20000

end JapanTaxLaw.BatchLower4f2d88678f
