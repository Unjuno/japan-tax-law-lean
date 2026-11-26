import JapanTaxLaw.BatchStructLbl70686b5290Spec

namespace JapanTaxLaw.BatchStructLbl70686b5290

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl70686b5290
