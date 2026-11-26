import JapanTaxLaw.BatchStructLbl923ca96364Spec

namespace JapanTaxLaw.BatchStructLbl923ca96364

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl923ca96364
