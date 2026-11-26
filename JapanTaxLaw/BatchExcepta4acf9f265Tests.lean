import JapanTaxLaw.BatchExcepta4acf9f265Spec

namespace JapanTaxLaw.BatchExcepta4acf9f265

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepta4acf9f265
