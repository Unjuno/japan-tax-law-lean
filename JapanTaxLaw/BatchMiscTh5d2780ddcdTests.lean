import JapanTaxLaw.BatchMiscTh5d2780ddcdSpec

namespace JapanTaxLaw.BatchMiscTh5d2780ddcd

example : limit = 500000 := by rfl
example : applies 499999 = true := boundary_true
example : specApplies 0 = applies 0 := agree_spec_impl 0
example : specApplies 500001 = applies 500001 := agree_spec_impl 500001

end JapanTaxLaw.BatchMiscTh5d2780ddcd
