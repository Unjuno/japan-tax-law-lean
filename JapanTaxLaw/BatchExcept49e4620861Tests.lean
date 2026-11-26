import JapanTaxLaw.BatchExcept49e4620861Spec

namespace JapanTaxLaw.BatchExcept49e4620861

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept49e4620861
