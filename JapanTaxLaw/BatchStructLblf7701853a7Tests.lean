import JapanTaxLaw.BatchStructLblf7701853a7Spec

namespace JapanTaxLaw.BatchStructLblf7701853a7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf7701853a7
