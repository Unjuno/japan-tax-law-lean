import JapanTaxLaw.BatchStructLblc202126425Spec

namespace JapanTaxLaw.BatchStructLblc202126425

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblc202126425
