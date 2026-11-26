import JapanTaxLaw.BatchExceptf337dd81daSpec

namespace JapanTaxLaw.BatchExceptf337dd81da

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptf337dd81da
