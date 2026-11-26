import JapanTaxLaw.BatchStructLblf1a18ca256Spec

namespace JapanTaxLaw.BatchStructLblf1a18ca256

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf1a18ca256
