import JapanTaxLaw.BatchExcept9a76d0b942Spec

namespace JapanTaxLaw.BatchExcept9a76d0b942

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept9a76d0b942
