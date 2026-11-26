import JapanTaxLaw.BatchSameTrb9f0ac3ab7Spec

namespace JapanTaxLaw.BatchSameTrb9f0ac3ab7

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTrb9f0ac3ab7
