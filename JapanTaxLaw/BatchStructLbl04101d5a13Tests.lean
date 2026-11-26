import JapanTaxLaw.BatchStructLbl04101d5a13Spec

namespace JapanTaxLaw.BatchStructLbl04101d5a13

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl04101d5a13
