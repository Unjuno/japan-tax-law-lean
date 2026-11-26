import JapanTaxLaw.BatchStructLbl06d99e82cfSpec

namespace JapanTaxLaw.BatchStructLbl06d99e82cf

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl06d99e82cf
