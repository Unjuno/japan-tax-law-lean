import JapanTaxLaw.BatchStructLblf2207635f2Spec

namespace JapanTaxLaw.BatchStructLblf2207635f2

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblf2207635f2
