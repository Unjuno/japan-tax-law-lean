import JapanTaxLaw.BatchStructLbl56add3a2a6Spec

namespace JapanTaxLaw.BatchStructLbl56add3a2a6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl56add3a2a6
