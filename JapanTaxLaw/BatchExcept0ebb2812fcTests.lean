import JapanTaxLaw.BatchExcept0ebb2812fcSpec

namespace JapanTaxLaw.BatchExcept0ebb2812fc

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept0ebb2812fc
