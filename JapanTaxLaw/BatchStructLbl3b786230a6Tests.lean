import JapanTaxLaw.BatchStructLbl3b786230a6Spec

namespace JapanTaxLaw.BatchStructLbl3b786230a6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3b786230a6
