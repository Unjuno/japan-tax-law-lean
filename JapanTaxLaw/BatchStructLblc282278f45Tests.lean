import JapanTaxLaw.BatchStructLblc282278f45Spec

namespace JapanTaxLaw.BatchStructLblc282278f45

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblc282278f45
