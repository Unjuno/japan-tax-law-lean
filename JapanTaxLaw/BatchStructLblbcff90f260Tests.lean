import JapanTaxLaw.BatchStructLblbcff90f260Spec

namespace JapanTaxLaw.BatchStructLblbcff90f260

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblbcff90f260
