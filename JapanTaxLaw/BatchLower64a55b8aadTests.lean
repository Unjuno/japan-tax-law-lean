import JapanTaxLaw.BatchLower64a55b8aadSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower64a55b8aad

example : lowerYen = 1600000 := by decide
example : meets 1599999 = false := by decide
example : meets 1600000 = true := by decide
example : specMeets 1599999 = meets 1599999 := agree_spec_impl 1599999
example : specMeets 1600000 = meets 1600000 := agree_spec_impl 1600000
example : specMeets 3200000 = meets 3200000 := agree_spec_impl 3200000

end JapanTaxLaw.BatchLower64a55b8aad
