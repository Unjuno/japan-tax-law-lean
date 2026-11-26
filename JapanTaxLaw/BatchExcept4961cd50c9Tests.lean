import JapanTaxLaw.BatchExcept4961cd50c9Spec

namespace JapanTaxLaw.BatchExcept4961cd50c9

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept4961cd50c9
