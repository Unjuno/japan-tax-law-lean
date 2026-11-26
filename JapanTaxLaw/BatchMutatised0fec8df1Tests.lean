import JapanTaxLaw.BatchMutatised0fec8df1Spec

namespace JapanTaxLaw.BatchMutatised0fec8df1

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatised0fec8df1
