import JapanTaxLaw.BatchStructLbl71245fc760Spec

namespace JapanTaxLaw.BatchStructLbl71245fc760

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl71245fc760
