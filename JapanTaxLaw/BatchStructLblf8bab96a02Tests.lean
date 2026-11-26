import JapanTaxLaw.BatchStructLblf8bab96a02Spec

namespace JapanTaxLaw.BatchStructLblf8bab96a02

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf8bab96a02
