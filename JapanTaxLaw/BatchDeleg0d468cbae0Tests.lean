import JapanTaxLaw.BatchDeleg0d468cbae0Spec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchDeleg0d468cbae0

example : limit = 1000000000 := by decide
example : specApplies false 0 = applies false 0 := by rfl
example : specApplies true 1000000001 = applies true 1000000001 := agree_spec_impl true 1000000001
example : specApplies true 0 = applies true 0 := agree_spec_impl true 0

end JapanTaxLaw.BatchDeleg0d468cbae0
