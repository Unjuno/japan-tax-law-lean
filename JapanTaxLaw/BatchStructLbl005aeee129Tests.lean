import JapanTaxLaw.BatchStructLbl005aeee129Spec

namespace JapanTaxLaw.BatchStructLbl005aeee129

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl005aeee129
