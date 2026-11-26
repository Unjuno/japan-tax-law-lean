import JapanTaxLaw.BatchExcept4317a82d53Spec

namespace JapanTaxLaw.BatchExcept4317a82d53

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4317a82d53
