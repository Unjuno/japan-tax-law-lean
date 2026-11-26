import JapanTaxLaw.BatchStructLbl01f972a205Spec

namespace JapanTaxLaw.BatchStructLbl01f972a205

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl01f972a205
