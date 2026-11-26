import JapanTaxLaw.BatchStructLblcbd7313245Spec

namespace JapanTaxLaw.BatchStructLblcbd7313245

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLblcbd7313245
