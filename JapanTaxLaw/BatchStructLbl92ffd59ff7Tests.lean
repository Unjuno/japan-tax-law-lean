import JapanTaxLaw.BatchStructLbl92ffd59ff7Spec

namespace JapanTaxLaw.BatchStructLbl92ffd59ff7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl92ffd59ff7
