import JapanTaxLaw.BatchStructLbl01ca9810f0Spec

namespace JapanTaxLaw.BatchStructLbl01ca9810f0

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl01ca9810f0
