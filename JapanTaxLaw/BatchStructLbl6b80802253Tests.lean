import JapanTaxLaw.BatchStructLbl6b80802253Spec

namespace JapanTaxLaw.BatchStructLbl6b80802253

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl6b80802253
