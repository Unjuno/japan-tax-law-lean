import JapanTaxLaw.BatchStructLbl70b31354bfSpec

namespace JapanTaxLaw.BatchStructLbl70b31354bf

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl70b31354bf
