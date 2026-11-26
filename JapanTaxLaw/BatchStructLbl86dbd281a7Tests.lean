import JapanTaxLaw.BatchStructLbl86dbd281a7Spec

namespace JapanTaxLaw.BatchStructLbl86dbd281a7

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl86dbd281a7
