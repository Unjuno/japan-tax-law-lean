import JapanTaxLaw.BatchStructLbl500082b9b8Spec

namespace JapanTaxLaw.BatchStructLbl500082b9b8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl500082b9b8
