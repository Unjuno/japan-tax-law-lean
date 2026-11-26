import JapanTaxLaw.BatchStructLbl3900ee1bd7Spec

namespace JapanTaxLaw.BatchStructLbl3900ee1bd7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3900ee1bd7
