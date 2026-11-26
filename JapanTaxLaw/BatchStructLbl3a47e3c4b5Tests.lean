import JapanTaxLaw.BatchStructLbl3a47e3c4b5Spec

namespace JapanTaxLaw.BatchStructLbl3a47e3c4b5

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3a47e3c4b5
