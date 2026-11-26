import JapanTaxLaw.BatchExceptd74f11de14Spec

namespace JapanTaxLaw.BatchExceptd74f11de14

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptd74f11de14
