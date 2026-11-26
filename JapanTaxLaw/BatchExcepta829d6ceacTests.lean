import JapanTaxLaw.BatchExcepta829d6ceacSpec

namespace JapanTaxLaw.BatchExcepta829d6ceac

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta829d6ceac
