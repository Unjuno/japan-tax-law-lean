import JapanTaxLaw.BatchDeleg3db2e6166bSpec

/-! Kernel-decided boundary tests. -/
namespace JapanTaxLaw.BatchDeleg3db2e6166b

example : limit = 500000000 := by decide
example : specApplies false 0 = applies false 0 := by rfl
example : specApplies true 500000001 = applies true 500000001 := agree_spec_impl true 500000001
example : specApplies true 0 = applies true 0 := agree_spec_impl true 0

end JapanTaxLaw.BatchDeleg3db2e6166b
