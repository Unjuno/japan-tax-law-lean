import JapanTaxLaw.BatchStructLbl592d10fba3Spec

namespace JapanTaxLaw.BatchStructLbl592d10fba3

example : labelCode.1 > 0 := by decide
example : validCode labelCode = true := label_valid

end JapanTaxLaw.BatchStructLbl592d10fba3
