import JapanTaxLaw.BatchMutatis013879cfd0Spec

namespace JapanTaxLaw.BatchMutatis013879cfd0

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatis013879cfd0
