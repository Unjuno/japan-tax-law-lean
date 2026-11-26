import JapanTaxLaw.BatchStructLbl24ed792df7Spec

namespace JapanTaxLaw.BatchStructLbl24ed792df7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl24ed792df7
