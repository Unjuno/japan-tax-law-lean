import JapanTaxLaw.BatchExcept83dde1aa86Spec

namespace JapanTaxLaw.BatchExcept83dde1aa86

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept83dde1aa86
