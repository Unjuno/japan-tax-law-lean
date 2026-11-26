import JapanTaxLaw.BatchStructLbl92908a6c15Spec

namespace JapanTaxLaw.BatchStructLbl92908a6c15

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl92908a6c15
