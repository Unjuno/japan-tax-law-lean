import JapanTaxLaw.BatchExcept89a71a258dSpec

namespace JapanTaxLaw.BatchExcept89a71a258d

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept89a71a258d
