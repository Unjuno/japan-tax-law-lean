import JapanTaxLaw.BatchExcept0010eb4dfdSpec

namespace JapanTaxLaw.BatchExcept0010eb4dfd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept0010eb4dfd
