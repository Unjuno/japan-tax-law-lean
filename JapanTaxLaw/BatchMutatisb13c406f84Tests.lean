import JapanTaxLaw.BatchMutatisb13c406f84Spec

namespace JapanTaxLaw.BatchMutatisb13c406f84

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatisb13c406f84
