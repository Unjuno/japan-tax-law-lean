import JapanTaxLaw.BatchStructLbl8da1130728Spec

namespace JapanTaxLaw.BatchStructLbl8da1130728

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl8da1130728
