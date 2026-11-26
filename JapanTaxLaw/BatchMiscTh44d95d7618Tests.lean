import JapanTaxLaw.BatchMiscTh44d95d7618Spec

namespace JapanTaxLaw.BatchMiscTh44d95d7618

example : limit = 12000000 := by rfl
example : applies 12000000 = true := boundary_true
example : specApplies 0 = applies 0 := agree_spec_impl 0
example : specApplies 12000001 = applies 12000001 := agree_spec_impl 12000001

end JapanTaxLaw.BatchMiscTh44d95d7618
