import JapanTaxLaw.BatchExceptde2e50b8dfSpec

namespace JapanTaxLaw.BatchExceptde2e50b8df

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptde2e50b8df
