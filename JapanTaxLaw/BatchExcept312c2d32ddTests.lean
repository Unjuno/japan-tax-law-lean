import JapanTaxLaw.BatchExcept312c2d32ddSpec

namespace JapanTaxLaw.BatchExcept312c2d32dd

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExcept312c2d32dd
