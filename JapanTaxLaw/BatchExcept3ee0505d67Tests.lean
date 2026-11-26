import JapanTaxLaw.BatchExcept3ee0505d67Spec

namespace JapanTaxLaw.BatchExcept3ee0505d67

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept3ee0505d67
