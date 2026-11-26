import JapanTaxLaw.BatchStructLbl3a79ec3f85Spec

namespace JapanTaxLaw.BatchStructLbl3a79ec3f85

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3a79ec3f85
