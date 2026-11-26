import JapanTaxLaw.BatchStructLblc2bb2be476Spec

namespace JapanTaxLaw.BatchStructLblc2bb2be476

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblc2bb2be476
