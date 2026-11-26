import JapanTaxLaw.BatchStructLbl1301eb2c32Spec

namespace JapanTaxLaw.BatchStructLbl1301eb2c32

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl1301eb2c32
