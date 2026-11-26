import JapanTaxLaw.BatchStructLblfb756340a8Spec

namespace JapanTaxLaw.BatchStructLblfb756340a8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblfb756340a8
