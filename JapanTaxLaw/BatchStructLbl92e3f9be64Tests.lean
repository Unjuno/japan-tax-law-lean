import JapanTaxLaw.BatchStructLbl92e3f9be64Spec

namespace JapanTaxLaw.BatchStructLbl92e3f9be64

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl92e3f9be64
