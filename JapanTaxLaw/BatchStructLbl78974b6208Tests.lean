import JapanTaxLaw.BatchStructLbl78974b6208Spec

namespace JapanTaxLaw.BatchStructLbl78974b6208

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl78974b6208
