import JapanTaxLaw.BatchStructLbl6c1baf86a8Spec

namespace JapanTaxLaw.BatchStructLbl6c1baf86a8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl6c1baf86a8
