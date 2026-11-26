import JapanTaxLaw.BatchSameTr3ef204de60Spec

namespace JapanTaxLaw.BatchSameTr3ef204de60

example : treatment true true = true := by rfl
example : treatment false true = false := by rfl
example : treatment true false = false := by rfl
example : specTreatment true true = treatment true true := agree_spec_impl true true
example : specTreatment false true = treatment false true := agree_spec_impl false true

end JapanTaxLaw.BatchSameTr3ef204de60
