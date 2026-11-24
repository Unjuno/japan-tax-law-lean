import JapanTaxLaw.BatchDeleg26951af1b7Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchDeleg26951af1b7

example : limit = 9000 := by decide
example : specApplies false 0 = applies false 0 := by rfl
example : specApplies true 9001 = applies true 9001 := agree_spec_impl true 9001
example : specApplies true 0 = applies true 0 := agree_spec_impl true 0

end JapanTaxLaw.BatchDeleg26951af1b7
