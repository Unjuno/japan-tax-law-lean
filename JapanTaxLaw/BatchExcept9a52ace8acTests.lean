import JapanTaxLaw.BatchExcept9a52ace8acSpec

namespace JapanTaxLaw.BatchExcept9a52ace8ac

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept9a52ace8ac
