import JapanTaxLaw.BatchStructLbl7926a602b7Spec

namespace JapanTaxLaw.BatchStructLbl7926a602b7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl7926a602b7
