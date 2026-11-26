import JapanTaxLaw.BatchExcept390df3b911Spec

namespace JapanTaxLaw.BatchExcept390df3b911

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept390df3b911
