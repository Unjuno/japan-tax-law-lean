import JapanTaxLaw.BatchExceptde808970efSpec

namespace JapanTaxLaw.BatchExceptde808970ef

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptde808970ef
