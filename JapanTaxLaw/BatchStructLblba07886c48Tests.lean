import JapanTaxLaw.BatchStructLblba07886c48Spec

namespace JapanTaxLaw.BatchStructLblba07886c48

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblba07886c48
