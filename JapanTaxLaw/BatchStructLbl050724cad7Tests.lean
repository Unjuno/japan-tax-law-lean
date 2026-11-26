import JapanTaxLaw.BatchStructLbl050724cad7Spec

namespace JapanTaxLaw.BatchStructLbl050724cad7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl050724cad7
