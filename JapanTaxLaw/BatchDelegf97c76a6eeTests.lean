import JapanTaxLaw.BatchDelegf97c76a6eeSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchDelegf97c76a6ee

example : limit = 100000000 := by decide
example : specApplies false 0 = applies false 0 := by rfl
example : specApplies true 100000001 = applies true 100000001 := agree_spec_impl true 100000001
example : specApplies true 0 = applies true 0 := agree_spec_impl true 0

end JapanTaxLaw.BatchDelegf97c76a6ee
