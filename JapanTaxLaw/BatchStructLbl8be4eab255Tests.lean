import JapanTaxLaw.BatchStructLbl8be4eab255Spec

namespace JapanTaxLaw.BatchStructLbl8be4eab255

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl8be4eab255
