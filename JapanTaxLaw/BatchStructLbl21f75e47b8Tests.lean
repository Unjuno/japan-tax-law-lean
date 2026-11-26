import JapanTaxLaw.BatchStructLbl21f75e47b8Spec

namespace JapanTaxLaw.BatchStructLbl21f75e47b8

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl21f75e47b8
