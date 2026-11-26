import JapanTaxLaw.BatchStructLbl010c28d0d5Spec

namespace JapanTaxLaw.BatchStructLbl010c28d0d5

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl010c28d0d5
