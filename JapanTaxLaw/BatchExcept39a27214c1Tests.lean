import JapanTaxLaw.BatchExcept39a27214c1Spec

namespace JapanTaxLaw.BatchExcept39a27214c1

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept39a27214c1
