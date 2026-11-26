import JapanTaxLaw.BatchSameTrebc56fe2d8Spec

namespace JapanTaxLaw.BatchSameTrebc56fe2d8

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTrebc56fe2d8
