import JapanTaxLaw.BatchStructLbl98a5900c34Spec

namespace JapanTaxLaw.BatchStructLbl98a5900c34

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl98a5900c34
