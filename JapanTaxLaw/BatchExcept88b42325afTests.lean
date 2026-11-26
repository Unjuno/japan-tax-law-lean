import JapanTaxLaw.BatchExcept88b42325afSpec

namespace JapanTaxLaw.BatchExcept88b42325af

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept88b42325af
