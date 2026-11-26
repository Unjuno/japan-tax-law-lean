import JapanTaxLaw.BatchStructLbl71403b6301Spec

namespace JapanTaxLaw.BatchStructLbl71403b6301

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl71403b6301
