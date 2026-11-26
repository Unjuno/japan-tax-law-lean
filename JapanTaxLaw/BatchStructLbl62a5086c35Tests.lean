import JapanTaxLaw.BatchStructLbl62a5086c35Spec

namespace JapanTaxLaw.BatchStructLbl62a5086c35

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl62a5086c35
