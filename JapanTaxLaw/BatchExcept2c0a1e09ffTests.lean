import JapanTaxLaw.BatchExcept2c0a1e09ffSpec

namespace JapanTaxLaw.BatchExcept2c0a1e09ff

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept2c0a1e09ff
