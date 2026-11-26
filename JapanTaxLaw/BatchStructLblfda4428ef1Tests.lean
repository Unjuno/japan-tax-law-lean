import JapanTaxLaw.BatchStructLblfda4428ef1Spec

namespace JapanTaxLaw.BatchStructLblfda4428ef1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfda4428ef1
