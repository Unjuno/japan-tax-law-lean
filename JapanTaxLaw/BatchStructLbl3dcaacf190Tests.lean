import JapanTaxLaw.BatchStructLbl3dcaacf190Spec

namespace JapanTaxLaw.BatchStructLbl3dcaacf190

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3dcaacf190
