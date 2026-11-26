import JapanTaxLaw.BatchStructLbl03fdb55cf4Spec

namespace JapanTaxLaw.BatchStructLbl03fdb55cf4

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl03fdb55cf4
