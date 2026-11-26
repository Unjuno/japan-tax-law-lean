import JapanTaxLaw.BatchMutatisf2592a586eSpec

namespace JapanTaxLaw.BatchMutatisf2592a586e

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatisf2592a586e
