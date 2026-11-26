import JapanTaxLaw.BatchStructLbl811468bd5aSpec

namespace JapanTaxLaw.BatchStructLbl811468bd5a

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl811468bd5a
