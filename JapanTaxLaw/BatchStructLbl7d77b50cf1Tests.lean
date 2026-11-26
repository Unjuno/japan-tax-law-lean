import JapanTaxLaw.BatchStructLbl7d77b50cf1Spec

namespace JapanTaxLaw.BatchStructLbl7d77b50cf1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl7d77b50cf1
