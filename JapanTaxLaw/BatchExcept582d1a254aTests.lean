import JapanTaxLaw.BatchExcept582d1a254aSpec

namespace JapanTaxLaw.BatchExcept582d1a254a

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept582d1a254a
