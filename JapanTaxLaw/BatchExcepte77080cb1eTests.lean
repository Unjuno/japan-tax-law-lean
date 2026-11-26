import JapanTaxLaw.BatchExcepte77080cb1eSpec

namespace JapanTaxLaw.BatchExcepte77080cb1e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte77080cb1e
