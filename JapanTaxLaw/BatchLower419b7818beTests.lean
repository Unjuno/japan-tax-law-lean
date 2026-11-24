import JapanTaxLaw.BatchLower419b7818beSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower419b7818be

example : lowerYen = 150000 := by decide
example : meets 149999 = false := by decide
example : meets 150000 = true := by decide
example : specMeets 149999 = meets 149999 := agree_spec_impl 149999
example : specMeets 150000 = meets 150000 := agree_spec_impl 150000
example : specMeets 300000 = meets 300000 := agree_spec_impl 300000

end JapanTaxLaw.BatchLower419b7818be
