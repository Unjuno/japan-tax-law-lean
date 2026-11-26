import JapanTaxLaw.BatchSameTr601b4916acSpec

namespace JapanTaxLaw.BatchSameTr601b4916ac

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTr601b4916ac
