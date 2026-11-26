import JapanTaxLaw.BatchExceptb669ea8a3aSpec

namespace JapanTaxLaw.BatchExceptb669ea8a3a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptb669ea8a3a
