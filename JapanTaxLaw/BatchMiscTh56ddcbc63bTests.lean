import JapanTaxLaw.BatchMiscTh56ddcbc63bSpec

namespace JapanTaxLaw.BatchMiscTh56ddcbc63b

example : limit = 10000000 := by rfl
example : applies 9999999 = true := boundary_true
example : specApplies 0 = applies 0 := agree_spec_impl 0
example : specApplies 10000001 = applies 10000001 := agree_spec_impl 10000001

end JapanTaxLaw.BatchMiscTh56ddcbc63b
