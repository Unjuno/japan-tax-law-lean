import JapanTaxLaw.BatchExcept17c989202dSpec

namespace JapanTaxLaw.BatchExcept17c989202d

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept17c989202d
