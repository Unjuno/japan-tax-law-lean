import JapanTaxLaw.BatchExcepte869a8745aSpec

namespace JapanTaxLaw.BatchExcepte869a8745a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte869a8745a
