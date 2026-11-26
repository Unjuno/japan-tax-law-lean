import JapanTaxLaw.BatchStructLblcdd0309d32Spec

namespace JapanTaxLaw.BatchStructLblcdd0309d32

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblcdd0309d32
