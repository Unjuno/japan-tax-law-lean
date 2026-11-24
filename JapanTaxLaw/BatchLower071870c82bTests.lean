import JapanTaxLaw.BatchLower071870c82bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchLower071870c82b

example : lowerYen = 8 := by decide
example : meets 7 = false := by decide
example : meets 8 = true := by decide
example : specMeets 7 = meets 7 := agree_spec_impl 7
example : specMeets 8 = meets 8 := agree_spec_impl 8
example : specMeets 16 = meets 16 := agree_spec_impl 16

end JapanTaxLaw.BatchLower071870c82b
