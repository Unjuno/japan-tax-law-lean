import JapanTaxLaw.BatchSameTr65e3a2d8bcSpec

namespace JapanTaxLaw.BatchSameTr65e3a2d8bc

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTr65e3a2d8bc
