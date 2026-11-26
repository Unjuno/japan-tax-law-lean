import JapanTaxLaw.BatchExceptee276ff95eSpec

namespace JapanTaxLaw.BatchExceptee276ff95e

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptee276ff95e
