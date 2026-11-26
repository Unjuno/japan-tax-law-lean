import JapanTaxLaw.BatchStructLbl78f2bdc586Spec

namespace JapanTaxLaw.BatchStructLbl78f2bdc586

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl78f2bdc586
