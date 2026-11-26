import JapanTaxLaw.BatchExceptb348f2880cSpec

namespace JapanTaxLaw.BatchExceptb348f2880c

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb348f2880c
