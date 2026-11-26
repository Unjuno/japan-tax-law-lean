import JapanTaxLaw.BatchSameTr714f38bea5Spec

namespace JapanTaxLaw.BatchSameTr714f38bea5

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTr714f38bea5
