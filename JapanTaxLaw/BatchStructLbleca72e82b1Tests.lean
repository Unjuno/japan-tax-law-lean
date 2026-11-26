import JapanTaxLaw.BatchStructLbleca72e82b1Spec

namespace JapanTaxLaw.BatchStructLbleca72e82b1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbleca72e82b1
