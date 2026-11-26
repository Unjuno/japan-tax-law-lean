import JapanTaxLaw.BatchStructLbl03b506881fSpec

namespace JapanTaxLaw.BatchStructLbl03b506881f

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl03b506881f
