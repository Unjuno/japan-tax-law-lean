import JapanTaxLaw.BatchExceptecbcb5d724Spec

namespace JapanTaxLaw.BatchExceptecbcb5d724

example : effectApplies false = true := by rfl
example : effectApplies true = false := by rfl
example : specEffect false = effectApplies false := agree_spec_impl false
example : specEffect true = effectApplies true := agree_spec_impl true

end JapanTaxLaw.BatchExceptecbcb5d724
