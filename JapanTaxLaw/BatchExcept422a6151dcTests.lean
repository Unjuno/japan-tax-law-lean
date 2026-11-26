import JapanTaxLaw.BatchExcept422a6151dcSpec

namespace JapanTaxLaw.BatchExcept422a6151dc

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept422a6151dc
