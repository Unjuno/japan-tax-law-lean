import JapanTaxLaw.BatchStructLbl04cf21d141Spec

namespace JapanTaxLaw.BatchStructLbl04cf21d141

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl04cf21d141
