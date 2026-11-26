import JapanTaxLaw.BatchExceptd3ead2fbcdSpec

namespace JapanTaxLaw.BatchExceptd3ead2fbcd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd3ead2fbcd
