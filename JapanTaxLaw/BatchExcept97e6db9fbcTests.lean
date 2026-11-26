import JapanTaxLaw.BatchExcept97e6db9fbcSpec

namespace JapanTaxLaw.BatchExcept97e6db9fbc

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept97e6db9fbc
