import JapanTaxLaw.BatchStructLbl290f60deb6Spec

namespace JapanTaxLaw.BatchStructLbl290f60deb6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl290f60deb6
