import JapanTaxLaw.BatchStructLbl5db2d2dcb8Spec

namespace JapanTaxLaw.BatchStructLbl5db2d2dcb8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl5db2d2dcb8
