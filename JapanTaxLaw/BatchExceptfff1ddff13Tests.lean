import JapanTaxLaw.BatchExceptfff1ddff13Spec

namespace JapanTaxLaw.BatchExceptfff1ddff13

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptfff1ddff13
