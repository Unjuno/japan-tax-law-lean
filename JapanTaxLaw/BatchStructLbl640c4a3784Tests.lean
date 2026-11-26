import JapanTaxLaw.BatchStructLbl640c4a3784Spec

namespace JapanTaxLaw.BatchStructLbl640c4a3784

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl640c4a3784
