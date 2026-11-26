import JapanTaxLaw.BatchExceptbee51304f2Spec

namespace JapanTaxLaw.BatchExceptbee51304f2

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptbee51304f2
