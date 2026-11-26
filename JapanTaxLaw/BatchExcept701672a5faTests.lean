import JapanTaxLaw.BatchExcept701672a5faSpec

namespace JapanTaxLaw.BatchExcept701672a5fa

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept701672a5fa
