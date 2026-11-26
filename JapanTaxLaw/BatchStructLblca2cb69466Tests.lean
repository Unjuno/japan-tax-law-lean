import JapanTaxLaw.BatchStructLblca2cb69466Spec

namespace JapanTaxLaw.BatchStructLblca2cb69466

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblca2cb69466
