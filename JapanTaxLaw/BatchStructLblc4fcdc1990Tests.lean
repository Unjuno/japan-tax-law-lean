import JapanTaxLaw.BatchStructLblc4fcdc1990Spec

namespace JapanTaxLaw.BatchStructLblc4fcdc1990

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblc4fcdc1990
