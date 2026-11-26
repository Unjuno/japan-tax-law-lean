import JapanTaxLaw.BatchStructLbl72e52a70e8Spec

namespace JapanTaxLaw.BatchStructLbl72e52a70e8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl72e52a70e8
