import JapanTaxLaw.BatchStructLbl52a1beed96Spec

namespace JapanTaxLaw.BatchStructLbl52a1beed96

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl52a1beed96
