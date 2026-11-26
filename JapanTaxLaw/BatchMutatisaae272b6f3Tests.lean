import JapanTaxLaw.BatchMutatisaae272b6f3Spec

namespace JapanTaxLaw.BatchMutatisaae272b6f3

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatisaae272b6f3
