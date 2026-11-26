import JapanTaxLaw.BatchSameTrf56ba693beSpec

namespace JapanTaxLaw.BatchSameTrf56ba693be

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTrf56ba693be
