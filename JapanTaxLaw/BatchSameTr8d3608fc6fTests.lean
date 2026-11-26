import JapanTaxLaw.BatchSameTr8d3608fc6fSpec

namespace JapanTaxLaw.BatchSameTr8d3608fc6f

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTr8d3608fc6f
