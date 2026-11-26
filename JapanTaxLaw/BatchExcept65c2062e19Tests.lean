import JapanTaxLaw.BatchExcept65c2062e19Spec

namespace JapanTaxLaw.BatchExcept65c2062e19

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept65c2062e19
