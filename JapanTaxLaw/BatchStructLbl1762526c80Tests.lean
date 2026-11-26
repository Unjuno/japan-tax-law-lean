import JapanTaxLaw.BatchStructLbl1762526c80Spec

namespace JapanTaxLaw.BatchStructLbl1762526c80

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl1762526c80
