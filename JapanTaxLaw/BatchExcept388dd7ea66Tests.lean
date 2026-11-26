import JapanTaxLaw.BatchExcept388dd7ea66Spec

namespace JapanTaxLaw.BatchExcept388dd7ea66

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept388dd7ea66
