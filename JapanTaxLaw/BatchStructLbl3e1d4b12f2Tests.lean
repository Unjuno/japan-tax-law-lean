import JapanTaxLaw.BatchStructLbl3e1d4b12f2Spec

namespace JapanTaxLaw.BatchStructLbl3e1d4b12f2

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3e1d4b12f2
