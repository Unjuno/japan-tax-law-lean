import JapanTaxLaw.BatchExcepte1fd94222dSpec

namespace JapanTaxLaw.BatchExcepte1fd94222d

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte1fd94222d
