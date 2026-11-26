import JapanTaxLaw.BatchStructLbl05c378c999Spec

namespace JapanTaxLaw.BatchStructLbl05c378c999

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl05c378c999
