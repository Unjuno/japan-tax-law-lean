import JapanTaxLaw.BatchMiscThe4ba29de39Spec

namespace JapanTaxLaw.BatchMiscThe4ba29de39

example : limit = 200000 := by rfl
example : applies 200000 = true := boundary_true
example : specApplies 0 = applies 0 := agree_spec_impl 0
example : specApplies 200001 = applies 200001 := agree_spec_impl 200001

end JapanTaxLaw.BatchMiscThe4ba29de39
