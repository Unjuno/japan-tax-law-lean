import JapanTaxLaw.BatchStructLblbcad708297Spec

namespace JapanTaxLaw.BatchStructLblbcad708297

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblbcad708297
