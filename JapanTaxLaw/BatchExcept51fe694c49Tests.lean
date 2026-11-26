import JapanTaxLaw.BatchExcept51fe694c49Spec

namespace JapanTaxLaw.BatchExcept51fe694c49

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept51fe694c49
