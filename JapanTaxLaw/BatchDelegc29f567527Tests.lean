import JapanTaxLaw.BatchDelegc29f567527Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchDelegc29f567527

example : limit = 10000000 := by decide
example : specApplies false 0 = applies false 0 := by rfl
example : specApplies true 10000000 = applies true 10000000 := agree_spec_impl true 10000000
example : specApplies true 0 = applies true 0 := agree_spec_impl true 0

end JapanTaxLaw.BatchDelegc29f567527
