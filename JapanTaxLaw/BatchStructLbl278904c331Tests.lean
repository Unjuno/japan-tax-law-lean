import JapanTaxLaw.BatchStructLbl278904c331Spec

namespace JapanTaxLaw.BatchStructLbl278904c331

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl278904c331
