import JapanTaxLaw.BatchExcept67a1303f10Spec

namespace JapanTaxLaw.BatchExcept67a1303f10

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept67a1303f10
