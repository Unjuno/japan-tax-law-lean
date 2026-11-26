import JapanTaxLaw.BatchStructLbl307bd809b6Spec

namespace JapanTaxLaw.BatchStructLbl307bd809b6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl307bd809b6
