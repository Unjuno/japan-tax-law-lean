import JapanTaxLaw.BatchStructLbl95387e75d9Spec

namespace JapanTaxLaw.BatchStructLbl95387e75d9

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl95387e75d9
