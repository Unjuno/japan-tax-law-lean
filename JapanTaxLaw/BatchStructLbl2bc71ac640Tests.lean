import JapanTaxLaw.BatchStructLbl2bc71ac640Spec

namespace JapanTaxLaw.BatchStructLbl2bc71ac640

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl2bc71ac640
