import JapanTaxLaw.BatchStructLbl605909eaf6Spec

namespace JapanTaxLaw.BatchStructLbl605909eaf6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl605909eaf6
