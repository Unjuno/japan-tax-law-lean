import JapanTaxLaw.BatchStructLbl19a432bfc8Spec

namespace JapanTaxLaw.BatchStructLbl19a432bfc8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl19a432bfc8
