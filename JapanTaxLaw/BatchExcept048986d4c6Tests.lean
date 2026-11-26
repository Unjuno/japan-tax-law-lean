import JapanTaxLaw.BatchExcept048986d4c6Spec

namespace JapanTaxLaw.BatchExcept048986d4c6

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept048986d4c6
