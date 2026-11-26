import JapanTaxLaw.BatchStructLblf9991020e3Spec

namespace JapanTaxLaw.BatchStructLblf9991020e3

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf9991020e3
