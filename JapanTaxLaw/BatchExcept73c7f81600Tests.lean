import JapanTaxLaw.BatchExcept73c7f81600Spec

namespace JapanTaxLaw.BatchExcept73c7f81600

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept73c7f81600
