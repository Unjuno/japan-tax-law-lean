import JapanTaxLaw.BatchExcept015c32ee4fSpec

namespace JapanTaxLaw.BatchExcept015c32ee4f

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept015c32ee4f
