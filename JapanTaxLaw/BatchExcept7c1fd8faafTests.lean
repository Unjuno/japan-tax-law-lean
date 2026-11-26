import JapanTaxLaw.BatchExcept7c1fd8faafSpec

namespace JapanTaxLaw.BatchExcept7c1fd8faaf

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept7c1fd8faaf
