import JapanTaxLaw.BatchStructLbl73fa865cc2Spec

namespace JapanTaxLaw.BatchStructLbl73fa865cc2

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl73fa865cc2
