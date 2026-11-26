import JapanTaxLaw.BatchStructLbl51543215c5Spec

namespace JapanTaxLaw.BatchStructLbl51543215c5

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl51543215c5
