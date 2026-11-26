import JapanTaxLaw.BatchStructLbl14fa81bfdbSpec

namespace JapanTaxLaw.BatchStructLbl14fa81bfdb

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl14fa81bfdb
