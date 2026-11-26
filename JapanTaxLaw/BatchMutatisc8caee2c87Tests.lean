import JapanTaxLaw.BatchMutatisc8caee2c87Spec

namespace JapanTaxLaw.BatchMutatisc8caee2c87

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatisc8caee2c87
