import JapanTaxLaw.BatchExcepte5cb87a00aSpec

namespace JapanTaxLaw.BatchExcepte5cb87a00a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcepte5cb87a00a
