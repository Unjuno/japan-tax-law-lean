import JapanTaxLaw.BatchExcept1f170c485eSpec

namespace JapanTaxLaw.BatchExcept1f170c485e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept1f170c485e
