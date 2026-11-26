import JapanTaxLaw.BatchExcept34a850db2aSpec

namespace JapanTaxLaw.BatchExcept34a850db2a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept34a850db2a
