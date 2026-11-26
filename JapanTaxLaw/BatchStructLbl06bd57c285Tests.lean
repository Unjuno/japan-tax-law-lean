import JapanTaxLaw.BatchStructLbl06bd57c285Spec

namespace JapanTaxLaw.BatchStructLbl06bd57c285

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl06bd57c285
