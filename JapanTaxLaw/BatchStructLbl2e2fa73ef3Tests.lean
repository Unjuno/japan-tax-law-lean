import JapanTaxLaw.BatchStructLbl2e2fa73ef3Spec

namespace JapanTaxLaw.BatchStructLbl2e2fa73ef3

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl2e2fa73ef3
