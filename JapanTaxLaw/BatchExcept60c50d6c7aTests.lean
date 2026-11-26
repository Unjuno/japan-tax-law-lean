import JapanTaxLaw.BatchExcept60c50d6c7aSpec

namespace JapanTaxLaw.BatchExcept60c50d6c7a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept60c50d6c7a
