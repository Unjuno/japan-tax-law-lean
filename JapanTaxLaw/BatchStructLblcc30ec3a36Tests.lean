import JapanTaxLaw.BatchStructLblcc30ec3a36Spec

namespace JapanTaxLaw.BatchStructLblcc30ec3a36

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblcc30ec3a36
