import JapanTaxLaw.BatchStructLbl02d116205cSpec

namespace JapanTaxLaw.BatchStructLbl02d116205c

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl02d116205c
