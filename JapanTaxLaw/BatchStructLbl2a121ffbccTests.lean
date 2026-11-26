import JapanTaxLaw.BatchStructLbl2a121ffbccSpec

namespace JapanTaxLaw.BatchStructLbl2a121ffbcc

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl2a121ffbcc
