import JapanTaxLaw.BatchSameTrdb5192b42bSpec

namespace JapanTaxLaw.BatchSameTrdb5192b42b

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTrdb5192b42b
