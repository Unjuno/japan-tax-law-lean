import JapanTaxLaw.BatchStructLbl84451a36b4Spec

namespace JapanTaxLaw.BatchStructLbl84451a36b4

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl84451a36b4
