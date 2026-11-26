import JapanTaxLaw.BatchStructLbl04ae8343a8Spec

namespace JapanTaxLaw.BatchStructLbl04ae8343a8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl04ae8343a8
