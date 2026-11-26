import JapanTaxLaw.BatchMutatisdd8ff46a1eSpec

namespace JapanTaxLaw.BatchMutatisdd8ff46a1e

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatisdd8ff46a1e
