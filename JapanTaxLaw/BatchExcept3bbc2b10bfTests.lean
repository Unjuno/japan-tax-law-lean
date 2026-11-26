import JapanTaxLaw.BatchExcept3bbc2b10bfSpec

namespace JapanTaxLaw.BatchExcept3bbc2b10bf

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept3bbc2b10bf
