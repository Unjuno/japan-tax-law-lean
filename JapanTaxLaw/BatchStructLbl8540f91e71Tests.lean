import JapanTaxLaw.BatchStructLbl8540f91e71Spec

namespace JapanTaxLaw.BatchStructLbl8540f91e71

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl8540f91e71
