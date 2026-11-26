import JapanTaxLaw.BatchMutatis51390d5eb1Spec

namespace JapanTaxLaw.BatchMutatis51390d5eb1

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatis51390d5eb1
