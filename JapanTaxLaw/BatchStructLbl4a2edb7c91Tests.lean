import JapanTaxLaw.BatchStructLbl4a2edb7c91Spec

namespace JapanTaxLaw.BatchStructLbl4a2edb7c91

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl4a2edb7c91
