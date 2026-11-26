import JapanTaxLaw.BatchSameTr14f241f85bSpec

namespace JapanTaxLaw.BatchSameTr14f241f85b

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTr14f241f85b
