import JapanTaxLaw.BatchStructLbl200740d2e6Spec

namespace JapanTaxLaw.BatchStructLbl200740d2e6

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl200740d2e6
