import JapanTaxLaw.BatchStructLbl3534411758Spec

namespace JapanTaxLaw.BatchStructLbl3534411758

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl3534411758
