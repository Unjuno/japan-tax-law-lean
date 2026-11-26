import JapanTaxLaw.BatchSameTraf7a5d43cbSpec

namespace JapanTaxLaw.BatchSameTraf7a5d43cb

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTraf7a5d43cb
