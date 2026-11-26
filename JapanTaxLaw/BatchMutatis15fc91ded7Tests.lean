import JapanTaxLaw.BatchMutatis15fc91ded7Spec

namespace JapanTaxLaw.BatchMutatis15fc91ded7

example : appliesVia true true = true := by rfl
example : appliesVia true false = false := by rfl
example : appliesVia false true = false := by rfl
example : specApplies true true = appliesVia true true := agree_spec_impl true true
example : specApplies false true = appliesVia false true := agree_spec_impl false true

end JapanTaxLaw.BatchMutatis15fc91ded7
