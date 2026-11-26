import JapanTaxLaw.BatchStructLbl162fa215a1Spec

namespace JapanTaxLaw.BatchStructLbl162fa215a1

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl162fa215a1
