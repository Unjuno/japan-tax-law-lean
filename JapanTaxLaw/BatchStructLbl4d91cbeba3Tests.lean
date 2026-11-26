import JapanTaxLaw.BatchStructLbl4d91cbeba3Spec

namespace JapanTaxLaw.BatchStructLbl4d91cbeba3

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl4d91cbeba3
