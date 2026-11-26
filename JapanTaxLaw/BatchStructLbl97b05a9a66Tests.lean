import JapanTaxLaw.BatchStructLbl97b05a9a66Spec

namespace JapanTaxLaw.BatchStructLbl97b05a9a66

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl97b05a9a66
