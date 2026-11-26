import JapanTaxLaw.BatchExcept376fd6d816Spec

namespace JapanTaxLaw.BatchExcept376fd6d816

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept376fd6d816
