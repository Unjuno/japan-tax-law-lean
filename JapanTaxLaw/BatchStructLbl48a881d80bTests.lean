import JapanTaxLaw.BatchStructLbl48a881d80bSpec

namespace JapanTaxLaw.BatchStructLbl48a881d80b

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl48a881d80b
