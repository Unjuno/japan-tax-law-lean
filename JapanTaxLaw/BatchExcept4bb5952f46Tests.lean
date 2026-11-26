import JapanTaxLaw.BatchExcept4bb5952f46Spec

namespace JapanTaxLaw.BatchExcept4bb5952f46

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4bb5952f46
