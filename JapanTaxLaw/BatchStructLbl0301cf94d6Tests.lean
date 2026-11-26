import JapanTaxLaw.BatchStructLbl0301cf94d6Spec

namespace JapanTaxLaw.BatchStructLbl0301cf94d6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl0301cf94d6
