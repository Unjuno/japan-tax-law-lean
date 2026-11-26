import JapanTaxLaw.BatchMutatis82b5155b86Spec

namespace JapanTaxLaw.BatchMutatis82b5155b86

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatis82b5155b86
