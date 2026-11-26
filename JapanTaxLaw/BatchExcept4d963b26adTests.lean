import JapanTaxLaw.BatchExcept4d963b26adSpec

namespace JapanTaxLaw.BatchExcept4d963b26ad

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4d963b26ad
